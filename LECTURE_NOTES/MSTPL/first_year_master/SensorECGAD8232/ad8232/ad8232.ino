#include <SPI.h>
#include <SD.h>
#include <EEPROM.h>

#define EEPROM_ADDRESS (0)
#define GSR_PLUS (8)
#define GSR_MINUS (9)
#define SAMPLE_TIME_MS (5)
#define THRESHOLD (365)

Sd2Card card;
SdVolume volume;
File data_file;

int count_file = 0;

// pin select dell'SD card
const int chipSelect = 10;

int gsr_data;

int btn_play_write = 2;
int btn_stop_write = 3;
int btn_clear = 4;

bool write_sd = false;

String dir_name = String("F");
String data_name = String("DATA");
String ext = String(".crd");

bool is_peak = true;
long prev_peak_time = 0;
long rr_interval;
long last_value = 0;
unsigned long prev_time = 0;
int bpm = 0;

void setup() {
  Serial.begin(115200);
  while (!Serial) { ; }

  // differenza di potenziale GSR
  pinMode(GSR_PLUS, INPUT); // Setup for leads off detection LO +
  pinMode(GSR_MINUS, INPUT); // Setup for leads off detection LO -

  pinMode(btn_play_write, INPUT_PULLUP);
  pinMode(btn_stop_write, INPUT_PULLUP);
  pinMode(btn_clear, INPUT_PULLUP);

  Serial.println("[INFO] Initializing SD card...");

  if (!SD.begin(chipSelect)) {
    Serial.println("[INFO] Initialization failed!");
    return;
  }

  Serial.println("[INFO] Initialization done.");

  int value_from_eeprom = EEPROM.read(EEPROM_ADDRESS) + 1;
  value_from_eeprom = value_from_eeprom > 100 ? 1 : value_from_eeprom;

  String buffer_dir = dir_name + String(value_from_eeprom);

  if (SD.exists(buffer_dir)) {
    Serial.println("[INFO] Folder exist! Remove and Overwrite it...");
    if (!remove_directory(buffer_dir)) {
      Serial.println("[ERROR] Problem in remove directory!");
      return;
    }
  }

  EEPROM.put(EEPROM_ADDRESS, value_from_eeprom);
  Serial.println(buffer_dir);
  if (!SD.mkdir(buffer_dir)) {
    Serial.println("[ERROR] Failed to create a directory!");
    return;
  }

  Serial.println("[INFO] Start time...");
}

void loop() {

  if (card.init(SPI_HALF_SPEED, chipSelect)) {
    if (!digitalRead(btn_play_write)) {
      if (!create_data_file()) {
        Serial.println("[ERROR] Problem in create data file!");
      }
      delay(10);
      write_sd = true;
    }

    if (write_sd) {
      data_file.print(gsr_data);
      data_file.print(",");
      data_file.print(bpm);
      data_file.print("\n");
      // Serial.print("[INFO] Sto scrivendo: ");
      Serial.println(gsr_data);
    }

    if (!digitalRead(btn_clear)) {
      Serial.println("[INFO] Erase SD...");
      int value_at = EEPROM.read(EEPROM_ADDRESS);
      for (int i = 1; i <= value_at; ++i) {
        String buffer_clear = dir_name + String(i);
        if (!remove_directory(buffer_clear)) {
          Serial.println("[ERROR] Problem in remove directory!");
        }
      }
      Serial.println("[INFO] Clear eeprom...");
      EEPROM.put(EEPROM_ADDRESS, 1);
    }

    if(!digitalRead(btn_stop_write) && write_sd) {
      data_file.close();
      Serial.println("[INFO] Ho interrotto la scrittura e salvato il file.");
      count_file = count_file >= 10 ? 0 : count_file + 1;
      write_sd = false;
    } 
  } else {
    Serial.println("[INFO] Card not present!");
    while (!card.init(SPI_HALF_SPEED, chipSelect)) { ; }
    bool init_sd = SD.begin(chipSelect);
    if (!init_sd) {
      Serial.println("[ERROR] SD not initialized!");
    }
    delay(100);
  }

  if ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { // check if leads are removed
    Serial.println("[INFO] Sensore non connesso...");
    while ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { ; }
  }
  gsr_data = analogRead(A0);  // valori di ampiezza della tensione di uscita dal sensore GSR
  // Serial.println(gsr_data);

  unsigned long start_time = millis();

  if (gsr_data != last_value && gsr_data > THRESHOLD) {
    if (!is_peak) {
      rr_interval = start_time - prev_peak_time;
      prev_peak_time = start_time;
      is_peak = true;
    }
  } else {
    is_peak = false;
  }
  
  last_value = gsr_data;
  while (start_time - prev_time < SAMPLE_TIME_MS) { 
    prev_time = start_time;
  }

  if (rr_interval > 0) {
    bpm = 60000 / rr_interval;
    // Serial.println("[INFO BPM] BPM: " + String(bpm));
  }
  
}

bool create_data_file() { 
  String buffer_dir_file = dir_name + String(EEPROM.read(EEPROM_ADDRESS)) + "/" + data_name + String(count_file) + ext;
  Serial.println(buffer_dir_file);
  data_file = SD.open(buffer_dir_file, FILE_WRITE);
  if (!data_file) { 
    Serial.println("[ERROR] File not initialized!");
    return false;
  }
  return true;
}

bool remove_directory(String name) {
  File dir = SD.open(name);
  if (!dir) {
    Serial.println("[ERROR] Directory not exists!");
    return false;
  }

  File subfile;
  while (subfile = dir.openNextFile()) {
    if (subfile.isDirectory()) {
      String subfile_dir_name = name + "/" + subfile.name();
      remove_directory(subfile_dir_name);
    } else {
      SD.remove(subfile.name());
    }
    subfile.close();
  }
  dir.close();
  SD.rmdir(name);
  return true;
}

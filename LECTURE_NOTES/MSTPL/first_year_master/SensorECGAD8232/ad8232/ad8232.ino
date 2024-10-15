#include <SPI.h>
#include <SD.h>
#include <EEPROM.h>

#define EEPROM_ADDRESS (0)
#define GSR_PLUS (8)
#define GSR_MINUS (9)
#define SAMPLE_TIME_MS (5)
#define THRESHOLD (450)
#define MAX_FOLDERS (100)
#define MAX_FILES_FOR_FOLDER (30)


String dir_name = "F";
String data_name = "D";
String ext = ".CRD";

Sd2Card card;
SdVolume volume;

int count_file = 0;

// pin select dell'SD card
const int chipSelect = 10;

int gsr_data;

int btn_play_write = 2;
int btn_stop_write = 3;
int btn_clear = 4;

bool write_sd = false;

int prev_time = 0;
int bpm = 0;
int prev_bpm = 0;

File data_file;

void setup() {
  Serial.begin(9600);
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
  value_from_eeprom = value_from_eeprom > MAX_FOLDERS ? 1 : value_from_eeprom;
  EEPROM.put(EEPROM_ADDRESS, value_from_eeprom);

  String buffer_dir = dir_name + String(value_from_eeprom);

  // controllare qui
  if (SD.exists(buffer_dir)) {
    Serial.println("[INFO] Remove and Overwrite it...");
    removeFolder(buffer_dir);
  }

  Serial.println("[INFO] Start...");
}

void loop() {

  if (!card.init(SPI_HALF_SPEED, chipSelect)) {
    Serial.println("[INFO] Card not present!");
    while (!card.init(SPI_HALF_SPEED, chipSelect)) { ; }
    bool init_sd = SD.begin(chipSelect);
    if (!init_sd) {
      Serial.println("[ERROR] SD not initialized!");
    }
    delay(100);
  }

  if (!digitalRead(btn_play_write)) {
    
    String dir_path = dir_name + String(EEPROM.read(EEPROM_ADDRESS));
    if (!SD.exists(dir_path)) {
      SD.mkdir(dir_path);
    }

    String buffer_file = dir_path + "/" + data_name + String(count_file) + ext;
    Serial.println(buffer_file);
    data_file = SD.open(buffer_file, FILE_WRITE);
    if (!data_file) {
      Serial.println("[ERROR] Problem in create data file!");
    } else {
      write_sd = true;
    }
  }

  if (data_file && write_sd) {
    data_file.print(gsr_data);
    data_file.print(",");
    data_file.print(bpm);
    data_file.print("\n");
    // Serial.print("[INFO] Sto scrivendo: ");
  }
  
  Serial.print(bpm);
  Serial.print(",");
  Serial.println(gsr_data);

  if (!digitalRead(btn_clear)) {
    Serial.println("[INFO] Erase SD...");
    for (int i = 1; i <= 100; ++i) {
      String folder_path = dir_name + String(i);
      removeFolder(folder_path);
    }

    Serial.println("[INFO] Clear eeprom");
    EEPROM.put(EEPROM_ADDRESS, 1);
    Serial.print("EEPROM ADDRESS: ");
    Serial.println(EEPROM.read(EEPROM_ADDRESS));
  }

  if(!digitalRead(btn_stop_write) && write_sd) {
    data_file.close();
    Serial.println("[INFO] Ho interrotto la scrittura e salvato il file.");
    count_file = count_file >= 30 ? 0 : count_file + 1;
    write_sd = false;
  } 

  if ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { // check if leads are removed
    Serial.println("[INFO] Sensore non connesso...");
    while ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { ; }
  }

  gsr_data = analogRead(A0);  // valori di ampiezza della tensione di uscita dal sensore GSR


  if (gsr_data >= THRESHOLD) {
    int start_time = millis();
    float rr = (float) (start_time - prev_time) / 1000.0;
    bpm = (int) ceil(60.0 / rr);
    bpm = bpm < 1024 ? bpm : prev_bpm;
    prev_time = start_time;
    prev_bpm = bpm;
  }

  delay(5);
  
}

void removeFolder(String folder_path) {
  File root = SD.open(folder_path);
  if (!root || !root.isDirectory()) {
    Serial.println("[ERROR] " + folder_path + " isn't a valid directory!");
    return;
  }

  File file = root.openNextFile();
  while (file) {
    String file_name = String(file.name());
    if (!file_name.startsWith("_") || !file_name.startsWith("~")) {
      String full_path = folder_path + "/" + file_name;
      SD.remove(full_path);
      Serial.println("[INFO] Remove file: " + full_path);
    }
    file.close();
    file = root.openNextFile();
  }
  root.close();
  SD.rmdir(folder_path);
  Serial.println("[INFO] Remove folder: " + folder_path);
  return;
}

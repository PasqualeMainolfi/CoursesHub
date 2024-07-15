#include <SPI.h>
#include <SD.h>
#include <EEPROM.h>

#define EEPROM_ADDRESS (0)
#define GSR_PLUS (8)
#define GSR_MINUS (9)
#define SAMPLE_TIME_MS (5)
#define THRESHOLD (365)

struct BpmData 
{
  bool is_peak;
  long prev_peak_time;
  int last_value;
  unsigned long prev_time;
  int bpm;

  BpmData() 
  : is_peak(true), prev_peak_time(0), last_value(0), prev_time(0), bpm(0)
  { }

  void detect_bpm(int data_in, unsigned long start_time) {
    unsigned long rr_interval = 0;
    if (data_in != this->last_value && data_in > THRESHOLD) {
      if (!this->is_peak) {
        rr_interval = start_time - this->prev_peak_time;
        this->prev_peak_time = start_time;
        this->is_peak = true;
      }
    } else {
      this->is_peak = false;
    }
    
    this->last_value = data_in;
    if (start_time - this->prev_time >= SAMPLE_TIME_MS) { 
      this->prev_time = start_time;
      if (rr_interval > 0) {
        this->bpm = 60000 / rr_interval;
        // Serial.println("[INFO BPM] BPM: " + String(bpm));
      }
    }
  }
};

class ManageFiles {
  public: 
    ManageFiles(String dir_name, String data_name) 
    : dir_name(dir_name), data_name(data_name), ext(".crd"), write(false), count_files(0)
    { };

    ~ManageFiles() { };

    bool create_file() {
      this->write = true;
      String buffer_dir_file = this->dir_name + String(EEPROM.read(EEPROM_ADDRESS)) + "/" + this->data_name + String(this->count_files) + this->ext;
      Serial.println(buffer_dir_file);
      this->data_file = SD.open(buffer_dir_file, FILE_WRITE);
      if (!this->data_file) { 
        Serial.println("[ERROR] File not initialized!");
        return false;
      }
      return true;
    };

    void write_to(int data_in, int bpm_in) {
      if (this->write) {
        data_file.print(data_in);
        data_file.print(",");
        data_file.print(bpm_in);
        data_file.print("\n");
      }
    }

    void save_and_close() {
      this->data_file.close();
      Serial.println("[INFO] Close and save file.");
      this->count_files = this->count_files >= 10 ? 0 : this->count_files + 1;
      this->write = false;
    }

    String dir_name;
    String data_name;
    String ext;
    bool write;
    File data_file;
    int count_files;
    
};

String dir_name = String("F");
String data_name = String("DATA");

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
};

void erase_sd() {
  Serial.println("[INFO] Erase SD...");
  int value_at = EEPROM.read(EEPROM_ADDRESS);
  for (int i = 1; i <= value_at; ++i) {
    String buffer_clear = dir_name + String(i);
    if (!remove_directory(buffer_clear)) {
      Serial.println("[ERROR] Problem in remove directory!");
      return;
    }
  }
  Serial.println("[INFO] Clear eeprom...");
  EEPROM.put(EEPROM_ADDRESS, 1);
  return;
};


Sd2Card card;
SdVolume volume;
File data_file;

// pin select dell'SD card
const int chipSelect = 10;

int gsr_data;

int btn_play_write = 2;
int btn_stop_write = 3;
int btn_clear = 4;

bool write_sd = false;

BpmData bpm_data;
ManageFiles manage_files(dir_name, data_name);


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
      manage_files.create_file();
    }

    manage_files.write_to(gsr_data, bpm_data.bpm);
    Serial.println(gsr_data);

    if (!digitalRead(btn_clear)) {
      erase_sd();
    }

    if(!digitalRead(btn_stop_write) && write_sd) {
      manage_files.save_and_close();
    } 
  } else {
    Serial.println("[INFO] Card not present!");
    while (!card.init(SPI_HALF_SPEED, chipSelect)) { ; }
    bool init_sd = SD.begin(chipSelect);
    if (!init_sd) {
      Serial.println("[ERROR] SD not initialized!");
    }
    delay(10);
  }

  bool leads = (digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1);
  if (leads) { // check if leads are removed
    Serial.println("[INFO] Sensore non connesso...");
    while (leads) { ; }
  }

  gsr_data = analogRead(A0);  // valori di ampiezza della tensione di uscita dal sensore GSR
  unsigned long start_time = millis();
  bpm_data.detect_bpm(gsr_data, start_time);
  
}
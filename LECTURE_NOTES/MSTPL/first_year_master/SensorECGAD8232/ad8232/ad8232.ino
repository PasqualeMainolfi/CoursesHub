#include <SPI.h>
#include <SD.h>
#include <TimeLib.h>

#define GSR_PLUS (8)
#define GSR_MINUS (9)

File data_file;

// pin select dell'SD card
const int chipSelect = 10;

int gsr_data;

int btn_play_write = 2;
int btn_stop_write = 3;
int btn_clear = 4;

bool write_sd = false;
bool close_sd = false;


void setup() {
  Serial.begin(9600);

  // differenza di potenziale GSR
  pinMode(GSR_PLUS, INPUT); // Setup for leads off detection LO +
  pinMode(GSR_MINUS, INPUT); // Setup for leads off detection LO -

  pinMode(btn_play_write, INPUT_PULLUP);
  pinMode(btn_stop_write, INPUT_PULLUP);
  pinMode(btn_clear, INPUT_PULLUP);

  Serial.print("Initializing SD card...");

  if (!SD.begin()) {
    Serial.println("initialization failed!");
    return;
  }

  Serial.println("initialization done.");

  time_t file_name = now();
  

  data_file = SD.open("DATA_GSR.txt", FILE_WRITE);
  
}

void loop() {

  if (data_file) {

    if (!digitalRead(btn_play_write)) {
      write_sd = true;
    }

    if (write_sd) {
      data_file.println(gsr_data);
      Serial.print("sto scrivendo: ");
      Serial.println(gsr_data);
    }

    if(!digitalRead(btn_stop_write) && write_sd) {
      data_file.close();
      Serial.println("ho interrotto la scrittura!");
      write_sd = false;
    } 

  }

  if((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { // check if leads are removed
    Serial.println("sensore non connesso ...");
  } else {
    gsr_data = analogRead(A0);  // valori di ampiezza della tensione di uscita dal sensore GSR
    Serial.println(gsr_data);
  }

  delay(1);

}

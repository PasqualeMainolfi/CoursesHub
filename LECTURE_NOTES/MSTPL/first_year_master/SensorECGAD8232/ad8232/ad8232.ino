// data in (ecg) -> text file (sd card) -> data elab.

#include <SD.h>

#define CHECK_SD (4)

File data;
bool run = true;

// aggiungere codice per la deallocazione di data (bottone per interrompere l'acquisizione)
// gestire il nome file
// funzione per la chiusura

void setup() {
  Serial.begin(9600);

  if (!SD.begin(CHECK_SD)) {
    Serial.println(F("SD CARD FAILED, OR NOT PRESENT!"));
    while (1);
  }

  if (!SD.exists("ecg-datalog_000.flb")) {
    data = SD.open("ecg-datalog_000.flb", FILE_WRITE);
  }

  pinMode(3, INPUT);
  pinMode(2, INPUT);

}

void loop() {

  int v1 = digitalRead(10);
  int v2 = digitalRead(11);

  if (run) {
    if ((v1 == 1) || (v2 == 1)) {
      Serial.println("!");
    } else {
      int val = analogRead(A5);
      data.println(val);
      Serial.println(val);
    }
  } else {
    data.close();
  }

  delay(1);

}
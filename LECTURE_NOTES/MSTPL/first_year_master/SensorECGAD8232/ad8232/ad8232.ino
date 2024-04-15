// data in (ecg) -> text file (sd card) -> data elab.

void setup() {
  Serial.begin(9600);

  pinMode(3, INPUT);
  pinMode(2, INPUT);
}

void loop() {

  int v1 = digitalRead(10);
  int v2 = digitalRead(11);

  if ((v1 == 1) || (v2 == 1)) {
    Serial.println("!");
  } else {
    int val = analogRead(A5);
    Serial.println(val);
  }

  delay(1);

}
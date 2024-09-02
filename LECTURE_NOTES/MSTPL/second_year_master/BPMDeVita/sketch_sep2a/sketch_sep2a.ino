
#define GSR_PLUS (10)
#define GSR_MINUS (11)

int data;

void setup() {
  Serial.begin(9600);
  while (!Serial) { ; }

  Serial.println("[INFO Start done!");

  pinMode(GSR_PLUS, INPUT);
  pinMode(GSR_MINUS, INPUT);

}

void loop() {
  
  if ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) {
    Serial.println("[INFO] Sensore non connesso!");
    while ((digitalRead(GSR_PLUS) == 1) || (digitalRead(GSR_MINUS) == 1)) { ; }
  }

  data = analogRead(A0);
  Serial.println(data);

  delay(10);

}

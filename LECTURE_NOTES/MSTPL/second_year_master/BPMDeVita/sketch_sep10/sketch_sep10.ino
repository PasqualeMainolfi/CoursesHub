/*
 * Convertitore A/D e ECG AD8232
 *
 * verde SX braccio
 * rosso DX braccio
 * giallo C dorso
 * 
 * 96 BPM = 1.6 BPS  
 * 90 BPM = 1.5 BPS 
 * 80 BPM = 1.3 BPS 
 * 60 BPM = 1 BPS
 * BPS = BPM / 60
 */


int ecg_data;
int num_samples = 4;
int threshold = 450;
float buffer_data = 0.0;
int buffer[16];
int index = 0;
//float start_time, end_time, elapsed_time, bpm;
int prev_time = 0;

int hor = 330;
uint16_t values = 0;

void setup() {
  Serial.begin(9600);

  pinMode(LED_BUILTIN, OUTPUT);

  // differenza di potenziale GSR
  pinMode(10, INPUT); // Setup for leads off detection LO +
  pinMode(11, INPUT); // Setup for leads off detection LO -
}

void loop() {
  if((digitalRead(10) == 1) || (digitalRead(11) == 1)) { //check if leads are removed
    // Serial.println("sensore non connesso ...");
    values = 0;
  } else {
    ecg_data = analogRead(A0);   // valori di ampiezza della tensione di uscita dal sensore GSR
    buffer[index] = ecg_data;

    index += 1;
    index = index % num_samples;
    values = 0;
    for (int i = 0; i < num_samples; ++i) {
      values += buffer[i];
    }
    
    values /= num_samples;

    if (values >= threshold) {
      int on_time = millis();
      int spike_time = on_time - prev_time;

      float sec = (float) spike_time / 1000.0;
      float bpm = 60.0 / sec;
      // Serial.println(bpm);
      prev_time = on_time;
    }

    // byte low = v & 0xFF;
    // byte high = (v >> 8) & 0xFF;

    // Serial.write(low);
    // Serial.write(high);
    // Serial.println(values);

    // Serial.print("LOW: ");
    // Serial.println(low, HEX);
    // Serial.print("HIGH: ");
    // Serial.println(high, HEX);
  }
  
  // byte* v = (byte*) &values;
  // Serial.write(v, 2);

  byte low = values & 0xFF;
  byte high = (values >> 8) & 0xFF;

  Serial.write(low);
  Serial.write(high);

  low = (values + 50) & 0xFF;
  high = ((values + 50) >> 8) & 0xFF;

  Serial.write(low);
  Serial.write(high);

  delay(5);
}

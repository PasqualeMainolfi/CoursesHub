// y = A sin(wt) = A sin(2*pi*f/p + phase)

int w = 1200;
int h = 400;

float incr = 0.01;


int nwave = 10;
Wave[] waves = new Wave[nwave];

void setup() {
  size(1200, 400);
  
  float f0 = 1;
  float a0 = h / 2;
  
  for (int i = 0; i < nwave; i++) {
    float amp = (a0 / (i + 1));
    //if (i % 2 != 0) {
    //  amp = 0.0;
    //}
    float freq = f0 * (i + 1);
    waves[i] = new Wave(freq, amp, 0.0);
  }
  
}

void draw() {

  background(0);
  
  for (int i = 0; i < w; i += 10) {
    float y = 0.0;
    for (Wave wave : waves) {
      y += wave.getValue(i);
    }
    float maxAmp = y + h / 2;
    if (maxAmp < 10) maxAmp = 0; 
    if (maxAmp > h - 10) maxAmp = h;
    circle(i, maxAmp, 5);
  }
   
  for (Wave wave : waves) {
    wave.updatePhase(incr);
  }
  
}

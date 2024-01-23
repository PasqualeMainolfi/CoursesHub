// y = A sin(wt) = A sin(2*pi*i/p + phase)

int w = 1200;
int h = 400;

float incr = 0.01;


int nwave = 5;
Wave[] waves = new Wave[nwave];

void setup() {
  size(1200, 400);
  
  for (int i = 0; i < nwave; i++) {
    waves[i] = new Wave(random(100, w), random(0, h / 2), random(0, 100));
  }
  
}

void draw() {

  background(0);
  
  for (int i = 0; i < w; i += 10) {
    float y = 0.0;
    for (Wave wave : waves) {
      y += wave.getValue(i);
    }
    circle(i, y + h / 2, 5);
  }
   
  for (Wave wave : waves) {
    wave.updatePhase(incr);
  }
  
 
	
}

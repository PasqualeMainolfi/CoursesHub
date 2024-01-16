// y = A sin(wt) = A sin(2*pi*i/p + phase)

int w = 1200;
int h = 400;

float xc = w / 2;
float yc = h / 2;

float a = h;
float p = w;
float phi = 0;

float incr = 0.01;

void setup() {
  size(1200, 400);
}

void draw() {
  background(0);
 
  for (int i = 0; i < w; i += 10) {
    float y = a * sin(2 * PI * i / p + phi);
    circle(i, y + h / 2, 10);
  }
  
  phi += incr;
  

}

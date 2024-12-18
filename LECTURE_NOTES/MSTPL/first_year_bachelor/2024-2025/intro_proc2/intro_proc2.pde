
PVector pos;
int inverti_x = 1;
int inverti_y = 1;

void setup() {
  size(400, 400);
  frameRate(30);
  
  pos = new PVector(width / 2, height / 2);
  
}

void draw() {
  background(255);
  
  fill(0);
  circle(pos.x, pos.y, 15);
  PVector random_pos = PVector.random2D();
  random_pos.x += 1;
  random_pos.y += 1;
 
  
  if (pos.x >= width - 7.5 || pos.x <= 7.5) {
    inverti_x = -1;
  }
  
  if (pos.y >= height - 7.5 || pos.y <= 7.5) {
    inverti_y = -1;
  }
  
  random_pos.x *= inverti_x;
  random_pos.y *= inverti_y;
  
  println(random_pos.x, random_pos.y, inverti_x, inverti_y);
  
  pos.add(random_pos);
  
  // risolvere il problema del rimbalzo
  // quello sotto è sbagliato... correggere!
  
  
}

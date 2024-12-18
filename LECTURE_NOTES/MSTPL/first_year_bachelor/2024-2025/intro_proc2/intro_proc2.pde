
PVector pos;

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
  pos.add(random_pos);
  
  // risolvere il problema del rimbalzo
  // quello sotto è sbagliato... correggere!
  if (pos.x >= width - 7.5) {
    pos.x -= random_pos.x;
  };
  
  if (pos.y >= height - 7.5) {
    pos.y -= random_pos.y;
  };
  
}

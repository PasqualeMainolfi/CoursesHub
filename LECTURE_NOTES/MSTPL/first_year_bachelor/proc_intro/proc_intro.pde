
int w = 0;
boolean check = false;

float x = width / 2;
float y = height / 2;

void setup() // ambito setup
{
  size(400, 400);
  frameRate(30);
}

void draw()
{
  background(255);
  //fill(255, 0, 0);
  //circle(mouseX, mouseY, 25);

  //float x = width / 2;
  //float y = height / 2;

  //rectMode(CENTER);
  //fill(255);
  //rect(x, y, 140, 100);

  //rectMode(CENTER);
  //fill(0);
  //rect(x, y, 70, 50);
  
  fill(255, 0, 0);
  circle(x, y, w);
  
  if (!check) {
    w += 1;
  } else {
    w -= 1;
  }
  
  if (w >= 30) {
    check = true;
  }
  
  if (w == 0) {
    x = random(0, width);
    y = random(0, height);
    check = false;
  }
  
  
}

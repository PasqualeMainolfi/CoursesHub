import netP5.*;
import oscP5.*;

OscP5 oscp5;
NetAddress location;

String HOST = "localhost";
int PORT = 6969;

void setup() {
  size(800, 800);
  oscp5 = new OscP5(this, PORT);
  location = new NetAddress(HOST, PORT);
}

void draw() {
  float data_x = mouseX / (float) width;
  float data_y = mouseY;
  
  OscMessage mes = new OscMessage("/mouse_x");

  mes.add(data_x);
  mes.add(data_y);
  oscp5.send(mes, location);
  //delay(100);
}

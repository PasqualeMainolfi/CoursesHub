import oscP5.*;
import netP5.*;


int PORTIN = 8969;
int PORTOUT = 8000;
String ADDRESS = "127.0.0.1";

OscP5 client;
NetAddress location;

void setup() {

    size(800, 800);

    client = new OscP5(this, PORTIN);
    location = new NetAddress(ADDRESS, PORTOUT);

}

void draw() {

     //float data = random(0, 100);

     //OscMessage message = new OscMessage("/test");
     //message.add(data);

     //client.send(message, location);
    
     //delay(1000);

}

void oscEvent(OscMessage message) {
  var addrPattern = message.addrPattern();
  var typeTag = message.typetag();
  println("### received an osc message with addrpattern "+addrPattern+" and typetag "+typeTag);
}

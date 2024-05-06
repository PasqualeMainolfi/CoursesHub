import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; //Import the MidiMessage classes http://java.sun.com/j2se/1.5.0/docs/api/javax/sound/midi/MidiMessage.html
import javax.sound.midi.SysexMessage;
import javax.sound.midi.ShortMessage;

MidiBus myBus; // The MidiBus

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 1, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {

}

public void rawMidi(byte[] data) {

  println("--- Raw Midi Data ---");
  
  int status = (int) (data[0] & 0xFF);
  int channel = (int) (data[0] & 0x0F);
  println("Status: " + status + " Channel: " + channel);

  if (status == 144) {
    int pitch = (int) (data[1]);
    int vel = (int) (data[2]);
    println("Pitch: " + pitch + " Velocity: " + vel);

  }

}


//public void noteOn(int channel, int pitch, int velocity) {
//    // Receive a noteOn
//    println();
//    println("Note On:");
//    println("--------");
//    println("Channel:"+channel);
//    println("Pitch:"+pitch);
//    println("Velocity:"+velocity);
//}

//public void noteOff(int channel, int pitch, int velocity) {
//    // Receive a noteOff
//    println();
//    println("Note Off:");
//    println("--------");
//    println("Channel:"+channel);
//    println("Pitch:"+pitch);
//    println("Velocity:"+velocity);
//}

//public void controllerChange(int channel, int number, int value) {
//    // Receive a controllerChange
//    println();
//    println("Controller Change:");
//    println("--------");
//    println("Channel:"+channel);
//    println("Number:"+number);
//    println("Value:"+value);
//}

public void delay(int time) {
    int current = millis();
    while (millis () < current+time) Thread.yield();
}

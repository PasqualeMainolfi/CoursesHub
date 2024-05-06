import processing.core.*;
import themidibus.*;


public class App extends PApplet {

    MidiBus myBus;

    public void settings() {
        size(400, 400);
    }

    public void setup() {
        background(255, 0, 0);

        MidiBus.list();
        myBus = new MidiBus(this, 1, -1);

    }

    public void draw() {

    }

    public void noteOn(int channel, int pitch, int velocity) {
        // Receive a noteOn
        println();
        println("Note On:");
        println("--------");
        println("Channel:"+channel);
        println("Pitch:"+pitch);
        println("Velocity:"+velocity);
    }
    
    public void noteOff(int channel, int pitch, int velocity) {
        // Receive a noteOff
        println();
        println("Note Off:");
        println("--------");
        println("Channel:"+channel);
        println("Pitch:"+pitch);
        println("Velocity:"+velocity);
    }
    
    public void controllerChange(int channel, int number, int value) {
        // Receive a controllerChange
        println();
        println("Controller Change:");
        println("--------");
        println("Channel:"+channel);
        println("Number:"+number);
        println("Value:"+value);
    }
    
    public void delay(int time) {
        int current = millis();
        while (millis () < current+time) Thread.yield();
    }


    public static void main(String[] args) {
        PApplet.main("App");
    }
}

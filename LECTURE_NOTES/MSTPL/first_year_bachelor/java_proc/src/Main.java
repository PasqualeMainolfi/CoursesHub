import processing.core.*;

public class Main extends PApplet {

    int n = 100;

    public void settings() {
        size(800, 800);
    }
    
    public void setup() {
        surface.setResizable(true);
        frameRate(60);

    }

    public void draw() {
        background(255, 0, 0);
        //circle(mouseX, mouseY, 30);
        //delay(100);
        
        
        noFill();
        beginShape();
        for(int i = 0; i < n; i++) {
            vertex(random(0, width), random(0, height));
        }
        endShape();

    }

    public static void main(String[] args) {
        PApplet.main("Main");

    }
}

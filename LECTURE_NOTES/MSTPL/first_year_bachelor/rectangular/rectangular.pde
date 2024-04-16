import processing.sound.*;

AudioIn audioIn;
Amplitude amp;
float thresh = 0.001;

float w = 800;
float h = 800;
int row = 50;
int col = 50;
Block[][] blocks = new Block[row][col];
float dim = w / row;

void setup() {
    size(800, 800);
    rectMode(CENTER);

    float offset = (dim / 2);

    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            blocks[i][j] = new Block(i * dim + offset, j * dim + offset, dim - 3);
        } 
    }
    amp = new Amplitude(this);
    audioIn = new AudioIn(this);
    audioIn.start();
    amp.input(audioIn);
    
}

void draw() {
    background(0);
    
    float current_amp = amp.analyze();
    
    float db = 20.0 * log10(current_amp);
    float phon = 40.0 * log10(current_amp) + 94;
    
    println(current_amp, db, phon);
    
   
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            blocks[i][j].display();
        } 
    }

    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            blocks[i][j].update(mouseX, mouseY);
        } 
    }  
}

float log10(float value) {
  return (log(value) / log(10));
}

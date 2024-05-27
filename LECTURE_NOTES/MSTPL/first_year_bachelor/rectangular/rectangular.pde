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
    audioIn = new AudioIn(this, 0);
    audioIn.start();
    amp.input(audioIn);
    
}

void draw() {
    background(0);
    
    float current_amp = amp.analyze();
    
    //float db = 20.0 * log10(current_amp);
    //float phon = 40.0 * log10(current_amp) + 94;
    

    float ampy = map(current_amp, 0, 1, 0, height);
    //println(current_amp, db, phon, ampy);
    
    float ampx = random(0, width);
    float fac = random(-1, 1); 
    ampx = fac * ampx + ampy;
    ampx %= width;
    //if (ampx >= width) { ampx -= width; }
    
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            blocks[i][j].display();
        } 
    }     

    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            blocks[i][j].update(ampx * 10, abs(height - ampy * 10));
        } 
    }  
}

float log10(float value) {
  return (log(value) / log(10));
}

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

}

void draw() {
    background(0);

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

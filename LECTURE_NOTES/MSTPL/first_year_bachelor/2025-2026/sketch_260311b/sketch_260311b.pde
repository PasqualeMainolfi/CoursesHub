int w = 600;
int h = 600;
int col = 50;
int row = 50;

Block[][] blocks;

float percent = 30;

void setup() {
  size(600, 600);
  
  blocks = new Block[row][col];
  
  int col_step = w / col;
  int row_step = h / row;
  
  float w_rect = col_step * percent / 100;
  float h_rect = row_step * percent / 100;
  rectMode(CENTER);
  
  //background(0);
  
  //for (int y = 0; y < h; y += row_step) {
  //  //line(0, y, w, y);
  //  float cy = y - row_step / 2;
  //  for (int x = 0; x < w; x += col_step) {
  //    //line(x, h, x, 0);
  //    float cx = x - col_step / 2;
  //    fill(255);
  //    rect(cx + col_step, cy + row_step, col_step - w_rect, row_step - h_rect);
  //  }
  //}
  
  for (int i = 0; i < row; i++) {
    float cy = (i * row_step) - row_step / 2;
    for (int j = 0; j < col; j++) {
      float cx = (j * col_step) - col_step / 2;
      blocks[i][j] = new Block(cx + col_step, cy + row_step, col_step - w_rect, row_step - h_rect);
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


}

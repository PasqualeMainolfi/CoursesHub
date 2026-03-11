class Block {
  
  float xcoord;
  float ycoord;
  float w;
  float h;
  
  // Costruttore
  Block(float x, float y, float wsize, float hsize) {
    this.xcoord = x;
    this.ycoord = y;
    this.w = wsize;
    this.h = hsize;
  }
  
  // metodo per la visualizzazione del blocco
  void display() {
    fill(255);
    rect(this.xcoord, this.ycoord, this.w, this.h);
  }
  
  void update_position(float x, float y) {
    this.xcoord = x;
    this.ycoord = y;
  }

}

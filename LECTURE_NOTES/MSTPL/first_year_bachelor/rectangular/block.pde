class Block {

    float x;
    float y;
    float dim;
    float angle;

    Block(float posx, float posy, float dimension) {
        this.x = posx;
        this.y = posy;
        this.dim = dimension;
        this.angle = 0.0;
    }

    void display() {
        pushMatrix();
        translate(this.x, this.y);
        rotate(this.angle);
        rect(0, 0, this.dim, this.dim);
        popMatrix();
    }

    void update(float x, float y) {

        float d = dist(x, y, this.x, this.y);
        if (d <= (this.dim / 2) + 30) {
            this.angle += 0.05;
        }

        if (this.angle > 0.0 && this.angle < HALF_PI) {
                this.angle += 0.05;
            } else {
                this.angle = 0.0;
            }

        this.angle %= TWO_PI;

    }
                        
}
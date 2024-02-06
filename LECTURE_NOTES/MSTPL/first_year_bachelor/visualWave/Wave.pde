
class Wave {
  
  float period;
  float amp;
  float phase;

  Wave(float p, float a, float ph) {
    this.period = p;
    this.amp = a;
    this.phase = ph;
  }
  
  float getValue(int t) {
    return this.amp * sin(2 * PI * this.period * t / width + this.phase);
  }
  
  void updatePhase(float phaseIncr) {  
    this.phase += phaseIncr;
    this.phase %= 2 * PI;
  }

}

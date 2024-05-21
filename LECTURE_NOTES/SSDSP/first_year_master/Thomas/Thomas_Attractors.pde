float b = 0.19;
float dt = 0.05;  // Passo di tempo 

PVector thomas1 = new PVector(0.1, 0.0, 0.0);
PVector thomas2 = new PVector(0.15, 0.5, 0.1);

void setup() {
  size(1300, 1000, P3D);  // Imposta la dimensione della finestra e utilizza il rendering 3D
  
  background(0);

}

void draw() {
  translate(width / 2, height / 2, 0);  // Trasla l'origine al centro della finestra
  scale(80);
  //println(thomas1.x, thomas1.y, thomas1.z)

  stroke(255);
  strokeWeight(0.03);
  point(thomas1.x, thomas1.y, thomas1.z);
  stroke(255, 0, 0);
  point(thomas2.x, thomas2.y, thomas2.z);

  PVector thomas_dot1 = new PVector();
  thomas_dot1.x = -b * thomas1.x + sin(thomas1.y);
  thomas_dot1.y = -b * thomas1.y + sin(thomas1.z);
  thomas_dot1.z = -b * thomas1.z + sin(thomas1.x);

  // Calcola le derivate per il secondo attrattore
  PVector thomas_dot2 = new PVector();
  thomas_dot2.x = -b * thomas2.x + sin(thomas2.y);
  thomas_dot2.y = -b * thomas2.y + sin(thomas2.z);
  thomas_dot2.z = -b * thomas2.z + sin(thomas2.x);

  // Aggiorna i valori del primo attrattore
  thomas1.add(thomas_dot1.mult(dt));

  // Aggiorna i valori del secondo attrattore
  thomas2.add(thomas_dot2.mult(dt));
 
}

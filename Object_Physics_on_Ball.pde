float t = 0;
float T = 0.05;
float f = 1, z = 0.2, r = 2;
float rate = 0.1;
boolean disabled = false;
Ball b;
void setup() {
  fullScreen(P2D);
  frameRate(120);
  b = new Ball(mouseX, mouseY,f, z, r);
}

void draw() {
  background(51);
  noStroke();
  PVector input = new PVector(mouseX, mouseY);
  PVector output = b.update(input, T);
  ellipse(output.x, output.y, 100, 100);
  t += T;
}

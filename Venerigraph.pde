PVector mouseVector;

int ringRadius = 250;
int knobRadius = 25;
int size = 640;
int center = size / 2;

void setup() {
  size(640, 640);
  smooth(4);
  
  mouseVector = new PVector(center, center - ringRadius);
}

void draw() {
  background(255);
  
  noFill();
  stroke(0);
  circle(center, center, ringRadius * 2);
  
  noStroke();
  fill(185, 60, 55); //ramsophone color
  circle(mouseVector.x, mouseVector.y, knobRadius);
}

void mouseDragged() {
  
  mouseVector.set(mouseX - center, mouseY - center);
  mouseVector.normalize();
  mouseVector.mult(ringRadius);
  mouseVector.add(center, center);
  
  
  
}

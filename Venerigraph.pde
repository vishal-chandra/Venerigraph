PVector mouseVector;

int radius = 250;
int size = 640;
int center = size / 2;

void setup() {
  size(640, 640);
  smooth(4);
  
  mouseVector = new PVector(center, center - radius);
}

void draw() {
  background(255);
  
  circle(center, center, radius * 2);
  
  line(center, center, mouseVector.x, mouseVector.y);
}

void mouseDragged() {
  
  mouseVector.set(mouseX - center, mouseY - center);
  mouseVector.normalize();
  mouseVector.mult(radius);
  mouseVector.add(center, center);
  
  
  
}

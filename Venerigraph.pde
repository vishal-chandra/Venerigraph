PVector knobVector, refVector, tempVector;
float knobAngle = 0;

int ringRadius = 250;
int knobRadius = 25;


int size = 640;
int center = size / 2;



void setup() {
  size(640, 640);
  smooth(4);
  
  //set both vectors to 12 o'clock position
  knobVector = new PVector(0, -ringRadius);
  refVector = new PVector(0, -ringRadius);
  tempVector = new PVector(0, 0);
}

void draw() {
  background(255);
  pushMatrix();
  translate(center, center);
  
  
  noFill();
  stroke(0);
  circle(0, 0, ringRadius * 2);
  
  line(0, 0, knobVector.x, knobVector.y);
  line(0, 0, refVector.x, refVector.y);
  
  noStroke();
  fill(185, 60, 55); //ramsophone color
  circle(knobVector.x, knobVector.y, knobRadius);
  
  popMatrix();
}

void mouseDragged() {
  
  knobVector.set(mouseX - center, mouseY - center);
  knobVector.normalize();
  knobVector.mult(ringRadius);
  
  //println(PVector.angleBetween(refVector.subtrac, knobVector));
  //float angleBetween = PVector.angleBetween(refVector, tempVector);
  //if(angleBetween <= knobAngle) { //if we've moved clockwise
  //  knobAngle = angleBetween;
  //  knobVector = tempVector.copy();
  //}
}

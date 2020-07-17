PVector knobVector, gearedKnobVector, refVector, tempVector;
float knobAngle = 0; 
float ringRatio = 0.5;

final int ringRadius = 250;
final int innerRingRadius = 125;
final int knobRadius = 25;

final int size = 640;
final int center = size / 2;


void setup() {
  size(640, 640);
  smooth(4);
  
  //set vectors to 12 o'clock position
  knobVector = new PVector(0, -ringRadius);
  gearedKnobVector = new PVector(0, -innerRingRadius);
  
  //reference is at inner ring magnitude because we will construct inner
  //knob position by transforming it
  refVector = new PVector(0, -innerRingRadius);
  tempVector = new PVector(0, 0);
}

void draw() {
  background(255);
  pushMatrix();
  translate(center, center);
  
  
  noFill();
  stroke(0);
  circle(0, 0, ringRadius * 2); //outer
  circle(0, 0, innerRingRadius * 2); //inner
  
  line(knobVector.x, knobVector.y, gearedKnobVector.x, gearedKnobVector.y);
  
  noStroke();
  fill(185, 60, 55); //ramsophone color
  circle(knobVector.x, knobVector.y, knobRadius);
  
  fill(60, 185, 55);
  circle(gearedKnobVector.x, gearedKnobVector.y, knobRadius);
  
  popMatrix();
}

void mouseDragged() {
  
  knobVector.set(mouseX - center, mouseY - center);
  knobVector.normalize();
  knobVector.mult(ringRadius);
  
  float angle = PVector.angleBetween(refVector, knobVector); 
  if(mouseX - center < 0) angle = TWO_PI - angle;
  
  gearedKnobVector = refVector.copy().rotate(angle * ringRatio); 
}

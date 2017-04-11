float diameter;
PVector location;

void setup() {
  size(800, 600);
  diameter = 400;
  location = new PVector(width/2, height/2);
}

void draw() {
  ellipse(location.x, location.y, diameter, diameter);
}
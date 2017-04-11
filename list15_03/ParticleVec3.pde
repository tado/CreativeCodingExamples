// パーティクル3Dクラス
class ParticleVec3 {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float friction;
  float radius;
  float mass;
  float minx, miny, minz;
  float maxx, maxy, maxz;
  ParticleVec3() {
    radius = 4.0;
    friction = 0.01;
    mass = 1.0;
    position = new PVector(width/2.0, height/2.0, 0);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    minx = 0;
    miny = 0;
    minz = -height;
    maxx = width;
    maxy = height;
    maxz = height;
  }
  void update() {
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    position.add(velocity);
    acceleration.set(0, 0, 0);
  }
  void draw() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    ellipse(0, 0, radius * 2, radius * 2);
    popMatrix();
  }
  void addForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
  void bounceOffWalls() {
    if (position.x > maxx) {
      position.x = maxx;
      velocity.x *= -1;
    }
    if (position.x < minx) {
      position.x = minx;
      velocity.x *= -1;
    }
    if (position.y > maxy) {
      position.y = maxy;
      velocity.y *= -1;
    }
    if (position.y < miny) {
      position.y = miny;
      velocity.y *= -1;
    }
    if (position.z > maxz) {
      position.z = maxz;
      velocity.z *= -1;
    }
    if (position.z < minz) {
      position.z = minz;
      velocity.z *= -1;
    }
  }
  void throughOffWalls() {
    if (position.x < minx) {
      position.x = maxx;
    }
    if (position.y < miny) {
      position.y = maxy;
    }
    if (position.z < minz) {
      position.z = maxz;
    }
    if (position.x > maxx) {
      position.x = minx;
    }
    if (position.y > maxy) {
      position.y = miny;
    }
    if (position.z > maxz) {
      position.z = minz;
    }
  }
  void addAttractionForce(PVector force, float radius, float scale) {
    float length = PVector.dist(position, force);
    PVector diff = new PVector();
    diff = position.get();
    diff.sub(force);
    boolean bAmCloseEnough = true;
    if (radius > 0) {
      if (length > radius) {
        bAmCloseEnough = false;
      }
    }
    if (bAmCloseEnough == true) {
      float pct = 1 - (length / radius);
      diff.normalize();
      diff.mult(scale);
      diff.mult(pct);
      acceleration.sub(diff);
    }
  }
}
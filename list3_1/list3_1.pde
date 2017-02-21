// 初期設定
void setup() {
  size(800, 600);
  frameRate(60);
  background(0);
  noStroke();
}

// 繰り返し描画
void draw() {
  float x = random(0, width);
  float y = random(0, height);
  float dist = dist(x, y, width/2, height/2);
  if (dist < height/2) {
    noStroke();
    fill(63, 127, 255);
  } else {
    noFill();
    stroke(31, 127, 255);
  }
  ellipse(x, y, 10, 10);
}
void setup() {
  size(800, 600);
  frameRate(60);
  background(0);
  noStroke();
}

void draw() {
  float x = random(0, width);
  float y = random(0, height);
  float dist = dist(x, y, width/2, height/2);
  // 円の直径を距離から算出する
  float diameter = 30 - dist / 10.0;
  // もし直径が0以上だったら
  if (diameter > 0) {
    // 色を指定して円を描画する
    fill(63, 127, 255);
    ellipse(x, y, diameter, diameter);
  }
}
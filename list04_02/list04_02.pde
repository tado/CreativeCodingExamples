float x; // X座標
float y; // Y座標

void setup() {
  size(800, 600); // 画面設定
  background(0); // 背景色設定
  frameRate(60); // フレームレート60fpsにする
  x = width / 2.0; // X座標を左右の中心にする
  y = height / 2.0; // Y座標を上限の中心にする
}

void draw() {
  stroke(255); // 点りの色
  noFill(); // 塗りなし
  point(x, y); // 点を描画
  x = x + random(-4, 4); // X座標をランダムに移動
  y = y + random(-4, 4); // Y座標をランダムに移動
}
int NUM = 10000; // 配列の数
float[] x = new float[NUM]; // X座標
float[] y = new float[NUM]; // Y座標

void setup() {
  size(800, 600); // 画面設定
  frameRate(60); // フレームレート60fpsに
  // 配列の数だけ繰り返す
  for (int i = 0; i < NUM; i++) {
    x[i] = width / 2.0; // X座標を左右の中心に
    y[i] = height / 2.0; // Y座標を上限の中心に
  }
}

void draw() {
  background(0); // 背景色
  stroke(255); // 点の色
  noFill(); // 塗りなし
  // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    point(x[i], y[i]); // 点を描画する
    x[i] = x[i] + random(-4.0, 4.0); // X座標をランダムに移動する
    y[i] = y[i] + random(-4.0, 4.0); // Y座標をランダムに移動する
  }
}
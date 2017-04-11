int NUM = 10000; // 配列の数
float[] x = new float[NUM]; // X座標
float[] y = new float[NUM]; // Y座標

void setup() {
  size(800, 600, P2D); // 描画モードをP2Dにする
  frameRate(60); // フレームレート60fpsにする
  background(0); // 背景色設定(最初に1度だけ塗る)
  // 配列の数だけ繰り返す
  for (int i = 0; i < NUM; i++) {
    x[i] = width / 2.0; // X座標を左右の中心にする
    y[i] = height / 2.0; // Y座標を上限の中心にする
  }
}

void draw() {
  stroke(255); // 点の色
  noFill(); // 塗りなし
  blendMode(ADD); // 色を加算していく
  // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    point(x[i], y[i]); // 点を描画
    x[i] = x[i] + random(-4.0, 4.0); // X座標をランダムに移動する
    y[i] = y[i] + random(-4.0, 4.0); // Y座標をランダムに移動する
  }
}
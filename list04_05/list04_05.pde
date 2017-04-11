int NUM = 10000; // 配列の数
float[] x = new float[NUM]; // X座標
float[] y = new float[NUM]; // Y座標

void setup() {
  size(800, 600, P2D); // 画面設定
  frameRate(60); // フレームレート60fpsにする
  background(0); // 背景色設定
  // 配列の数だけ繰り返す
  for (int i = 0; i < NUM; i++) {
    x[i] = random(width); // X座標を左右の中心にする
    y[i] = random(height); // Y座標を上限の中心にする
  }
}

void draw() {
  blendMode(ADD); // 色は加算で混ぜていく
  stroke(63); // 塗りの色
  noFill(); // 枠線なし
  // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    point(x[i], y[i]); // 点を描画
    x[i] = x[i] + random(-1.0, 1.0); // X座標をランダムに移動する
    y[i] = y[i] + random(-1.0, 1.0); // Y座標をランダムに移動する
  }
  // 画面をフェードさせる
  blendMode(BLEND);
  noStroke();
  fill(0, 3);
  rect(0, 0, width, height);
}
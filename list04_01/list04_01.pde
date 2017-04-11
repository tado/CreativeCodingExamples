int NUM = 10000; // 配列の数
float[] x = new float[NUM]; // X座標
float[] y = new float[NUM]; // Y座標

void setup() {
  size(800, 600, P2D); // 画面設定
  frameRate(60); // フレームレート60fpsにする
  background(0); // 背景色設定
  // 配列の数だけ繰り返す
  for (int i = 0; i < NUM; i++) {
    x[i] = width / 2.0; // X座標を左右の中心にする
    y[i] = height / 2.0; // Y座標を上限の中心にする
  }
}

void draw() {
  stroke(255); // 点の色
  noFill(); // 塗りなし
  blendMode(ADD); // 色は加算で混ぜていく
  // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    point(x[i], y[i]); // 点を描画
    x[i] = x[i] + random(-2.0, 2.0); // X座標をランダムに移動
    y[i] = y[i] + random(-2.0, 2.0); // Y座標をランダムに移動
  }
  // 画面をフェードさせる
  blendMode(BLEND); // 塗りを線形な混色に
  fill(0, 5); // 半透明の黒で塗る
  noStroke(); // 枠線なし
  rect(0, 0, width, height); // 画面全体を矩形で塗りつぶす
}
import processing.video.*; // ビデオライブラリのインポート
Capture cam; // カメラのインプット
float scale = 1.0; // 変化の全体スケール

public void setup() {
  size(800, 500, P3D);
  frameRate(60);
  blendMode(ADD);
  noFill();
  // ビデオキャプチャを初期化する
  cam = new Capture(this, width, height);
  cam.start();
}

public void draw() {
  background(0);
  strokeWeight(2.0);
  // ビデオ解析の粒度を設定する
  float hStep = 4.0;
  float wStep = 4.0;
  // 映像を解析する
  for (float j = 0; j < height; j += hStep) {
    beginShape(); // 線の描画を開始する
    for (float i = 0; i < width; i += wStep) {
      color col = cam.get(int(i), int(j)); // 色を取得する
      float br = brightness(col); // 明度を計算する
      stroke(col); // 線の色を設定する
      // 明るさとFFT解析の結果から高さを決定して頂点を追加
      vertex(i, j, br * scale);
    }
    endShape(); // 線の描画を終了する
  }
}

// カメラのフレームが更新されたらイベントを実行する
void captureEvent(Capture c) {
  cam.read();
}
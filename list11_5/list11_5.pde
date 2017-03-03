import processing.video.*; // ビデオライブラリのインポート
Capture cam; // ムービープレイヤの宣言
boolean playing; // ムービーを再生しているか否か

void setup() {
  // 画面初期設定
  size(853, 480);
  frameRate(60);
  noStroke();
  cam = new Capture(this); // カメラを初期化する
  cam.start(); // キャプチャを開始する
}

void draw() {
  background(0);
  int skip = 20; // 色をピックアップする間隔を設定する
  // 設定した間隔で画面をスキャン
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = cam.get(i, j); // 指定した座標の色を読み込む
      float br = brightness(col); // 明るさを抽出する
      fill(col); // 塗りの色を設定する
      // 明るさをサイズにして円を描く
      ellipse(i, j, skip * br / 255.0, skip * br / 255.0);
    }
  }
}

// カメラのフレームが更新されたらイベントを実行する
void captureEvent(Capture c) {
  cam.read();
}
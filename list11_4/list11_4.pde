import processing.video.*; // ビデオライブラリのインポート
Capture cam; // カメラの定義

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
  image(cam, 0, 0, width, height); // カメラの画像を描画する
}

// カメラのフレームが更新されたらイベント実行
void captureEvent(Capture c) {
  cam.read();
}
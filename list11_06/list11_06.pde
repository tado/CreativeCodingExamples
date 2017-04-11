import processing.video.*; // ビデオライブラリのインポート
Capture cam; // ムービープレイヤの宣言
float scanHeight; // スキャンしている場所(高さ)
float scanSpeed; // スキャンの移動スピード

void setup() {
  // 画面初期設定
  size(853, 480);
  frameRate(60);
  noStroke();
  cam = new Capture(this); // カメラを初期化する
  cam.start(); // キャプチャを開始する
  // スキャン位置とスピードの初期化
  scanHeight = 0.0;
  scanSpeed = 2.0;
  background(0);
}

void draw() {
  // 指定した高さの横1行だけスキャンする
  for (int i = 0; i < width; i++) {
    // 指定した座標の色を読み込む
    color col = cam.get(i, int(scanHeight));
    fill(col); // 塗りの色を設定する
    rect(i, scanHeight, 1, scanSpeed); // 四角形で色を塗る
  }
  // もしスキャンする場所が下端まできたら0にリセットする
  if (scanHeight > height) {
    scanHeight = 0;
  }
}

// カメラのフレームが更新されたらイベントを実行する
void captureEvent(Capture c) {
  cam.read(); // フレームを読み込む
  scanHeight += scanSpeed; // 指定した速さでスキャンの高さを移動する
}
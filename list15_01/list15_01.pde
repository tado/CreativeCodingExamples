import gab.opencv.*; // OpenCVライブラリのインポート 
import processing.video.*; // ビデオライラリーのインポート(カメラ入力用) 

OpenCV opencv; // OpenCVのインスタンス  
Capture video; // ライブカメラ 
ArrayList<Contour> contours; // 輪郭の配列

void setup() {  
  size(640, 480); // 画面サイズを設定する
  frameRate(60); // フレームレートを設定する
  opencv = new OpenCV(this, 640, 480); // 画面サイズを指定してOpenCVを初期化する
  video = new Capture(this, 640, 480); // ビデオキャプチャを初期化する
  video.start(); // キャプチャを開始する
} 

void draw() {
  opencv.loadImage(video); // カメラの画像をOpenCVに読み込む
  // 閾値の設定(マウスのX座標で変化)
  int threshold = int(map(mouseX, 0, width, 0, 100));
  opencv.threshold(threshold); // 設定した閾値を適用する
  contours = opencv.findContours(); // 輪郭を抽出する
  noFill();
  strokeWeight(2);
  background(0); // 背景を描画する
  // 検出された輪郭の数だけ輪郭線を描く
  for (int i = 0; i < contours.size(); i++) { 
    stroke(255);
    contours.get(i).draw();
  }
}

// カメラキャプチャのイベントを実行する
void captureEvent(Capture c) {
  c.read();
}
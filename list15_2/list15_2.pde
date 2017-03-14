import gab.opencv.*; // OpenCVライブラリのインポート
import processing.video.*; // ビデオライラリーのインポート(カメラ入力用)
OpenCV opencv; // OpenCVのインスタンス
Capture video; // ライブカメラ

void setup() {
  size(640, 480, P2D); // 画面サイズを設定する
  frameRate(60); // フレームレートを設定する
  // 画面サイズを指定してOpenCVを初期化する
  opencv = new OpenCV(this, width/2, height/2);
  // ビデオキャプチャを初期化する
  video = new Capture(this, width/2, height/2);
  video.start(); // キャプチャを開始する
}

void draw() {
  scale(2); // 画面全体をリスケールする
  opencv.loadImage(video); // カメラの画像をOpenCVに読み込む
  image(video, 0, 0 ); // カメラ画像を表示する
  opencv.calculateOpticalFlow(); // OpticalFlowを計算する
  stroke(255, 0, 0); // 描画設定する
  opencv.drawOpticalFlow(); // OpticalFlowを描画する
  // オプティカルフローの平均を解析する
  PVector aveFlow = opencv.getAverageFlow();
  int flowScale = 50;
  stroke(0, 0, 255);
  // オプティカルフローの平均を描画する
  line(video.width/2, video.height/2, 
    video.width/2 + aveFlow.x*flowScale, video.height/2 + aveFlow.y*flowScale);
}

// キャプチャイベント
void captureEvent(Capture c) {
  c.read();
}
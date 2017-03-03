import processing.video.*; // ビデオライブラリのインポート
import processing.sound.*; // サウンドライブラリのインポート
Capture cam; // カメラのインプット
AudioIn input; // オーディオインプット
FFT fft; // FFT(高速フーリエ変換)
int bands = 64; // FFTサイズを設定する
float scale = 20.0; // 変化の全体スケールを設定する

public void setup() {
  size(800, 500, P3D);
  frameRate(60);
  noFill();
  blendMode(ADD);
  cam = new Capture(this, width, height); // ビデオキャプチャを初期化する
  cam.start(); // オーディオインプットを初期化する
  input = new AudioIn(this, 0);
  input.start();
  fft = new FFT(this, bands); // FFTを初期化する
  fft.input(input);
}

public void draw() {
  background(0);
  fft.analyze(); // FFT解析
  strokeWeight(2.0);
  float hStep = height / float(bands) / 2.0; // ビデオ解析の粒度を設定する
  float wStep = 4.0;
  int n = 0; // FFT周波数帯域用カウンター
  // 映像を解析する
  for (float j = 0; j < height; j += hStep) {
    beginShape(); // 線の描画を開始する
    for (float i = 0; i < width; i += wStep) {
      color col = cam.get(int(i), int(j)); // 色を取得する
      float br = brightness(col); // 明度を計算する
      stroke(col); // 線の色を設定する
      // 明るさとFFT解析の結果から高さを決定して頂点を追加
      vertex(i, j, br * fft.spectrum[n] * scale);
    }
    endShape(); // 線の描画を終了する
  }
  n++; // 次の周波数帯域に
}

// カメラのフレームが更新されたらイベントを実行する
void captureEvent(Capture c) {
  cam.read();
}
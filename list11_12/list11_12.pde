import processing.sound.*; // Soundライブラリを読み込む
AudioIn in; // サウンド入力
FFT fft; // FFT(高速フーリエ変換)
int bands = 128; // FFTのサイズを設定する(2の累乗)
float scale = 5000.0; // グラフの高さのスケールを設定する

void setup() {
  size(800, 600);
  noStroke();
  in = new AudioIn(this, 0); // サウンド入力を初期化する
  in.start(); // 入力したサウンドを再生する
  fft = new FFT(this, bands); // FFTを初期化する
  fft.input(in); // FFTの入力信号を指定する
}

void draw() {
  background(0);
  fft.analyze(); // FFT解析を実行する
  float w = width/float(bands)/2.0; // グラフの横幅を算出する
  // FFTのバンドの数だけ繰り返し
  for (int i = 0; i < bands; i++) {
    // FFTの解析結果を色の明るさに変換
    fill(fft.spectrum[i] * scale);
    // 左右に四角形を描く
    rect(width/2.0 + i * w, 0, w, height);
    rect(width/2.0 - i * w, 0, w, height);
  }
}
import processing.sound.*; // Soundライブラリを読み込む
AudioIn in; // サウンド入力
FFT fft; // FFT(高速フーリエ変換)
int bands = 128; // FFTサイズを設定する
float scale = 40000.0; // グラフの高さのスケールを設定する

void setup() {
  size(800, 600, P2D);
  noStroke();
  blendMode(ADD);
  // HSB(色相、彩度、明度)モードで色を表現する
  colorMode(HSB, 360, 100, 100, 100);
  in = new AudioIn(this, 0); // サウンド入力を初期化する
  in.start(); // 入力したサウンドを再生する
  fft = new FFT(this, bands); // FFTを初期化する
  fft.input(in);
}

void draw() {
  background(0);
  fft.analyze(); // FFT解析を実行する
  float w = width/float(bands)/2.0; // グラフの横幅を算出する
  // FFTのバンドの数だけ繰り返し
  for (int i = 0; i < bands; i++) {
    float hue = 360/float(bands) * i; // 色相を計算する
    fill(hue, 100, 6); // HSBで色を指定する
    // 円の直径をFFT解析結果から算出
    float diameter = fft.spectrum[i] * scale;
    // 左右に円を描く
    ellipse(width/2.0 + i * w, height/2.0, diameter, diameter);
    ellipse(width/2.0 - i * w, height/2.0, diameter, diameter);
  }
}
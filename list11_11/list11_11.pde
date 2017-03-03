import processing.sound.*; // Soundライブラリを読み込む
AudioIn in; // サウンド入力
FFT fft; // FFT(高速フーリエ変換)
int bands = 1024; // FFTサイズを設定する
float scale = 20.0; // グラフの高さのスケールを設定する

void setup() {
  size(800, 600);
  in = new AudioIn(this, 0); // サウンド入力を初期化する
  in.start(); // 入力したサウンドを再生する
  fft = new FFT(this, bands); // FFTを初期化する
  fft.input(in);
}

void draw() {
  background(0);
  fft.analyze(); // FFT解析を実行する
  float w = width/float(bands); // グラフの横幅を算出する
  noFill();
  stroke(255);
  beginShape(); // 線分の描画を開始する 
  // FFTのバンドの数だけ繰り返し
  for (int i = 0; i < bands; i++) {
    // FFTの解析結果を高さにグラフを描く
    vertex(i * width/float(bands), height - fft.spectrum[i] * height * scale);
  }
  endShape(); // 線分の描画を終了する
}
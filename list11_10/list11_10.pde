import processing.sound.*; // Soundライブラリを読み込む
AudioIn in; // サウンド入力
Amplitude rms; // 音量解析

void setup() {
  size(800, 600);
  fill(0, 127, 255);
  noStroke();
  in = new AudioIn(this, 0); // サウンド入力を初期化する
  in.start(); // サウンド入力を開始する
  rms = new Amplitude(this); // 音量解析を初期化する
  rms.input(in); // 音量解析の入力を設定する
}

void draw() {
  background(0);
  // 音量を解析して値を調整する
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
  // 取得した音量で円を描く
  ellipse(width/2, height/2, diameter, diameter);
}
import processing.sound.*; // Soundライブラリを読み込む
SoundFile soundfile; // サウンドプレイヤ
Amplitude rms; // 音量解析

void setup() {
  size(800, 600);
  fill(0, 127, 255);
  noStroke();
  // サウンドファイルを読み込んでプレイヤを初期化する
  // ファイル名は読み込んだサウンドファイル名に変更する
  soundfile = new SoundFile(this, "sound.aiff");
  soundfile.loop(); // ループ再生する
  rms = new Amplitude(this); // 音量解析を初期化する
  rms.input(soundfile); // 音量解析の入力を設定する
}

void draw() {
  background(0);
  // 音量を解析して値を調整する
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
  // 取得した音量で円を描く
  ellipse(width/2, height/2, diameter, diameter);
}
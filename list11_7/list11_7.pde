import processing.sound.*; // Soundライブラリを読み込む
SoundFile soundfile; // サウンドプレイヤ

void setup() {
  size(800, 600);
  // サウンドファイルを読み込んでプレイヤを初期化する
  // ファイル名は読み込んだサウンドファイル名に変更する
  soundfile = new SoundFile(this, "sound.aiff");
  soundfile.loop(); // ループ再生する
}

void draw() {
  background(0);
}
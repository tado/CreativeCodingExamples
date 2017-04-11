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
  // マウスのX座標の位置でパン(左右の定位)を変更する
  soundfile.pan(map(mouseX, 0, width, -1.0, 1.0));
  // マウスのY座標の位置で再生スピードを変更する
  soundfile.rate(map(mouseY, 0, height, 0.25, 4.0));
  // マウスの位置を交差する線で表示する
  noFill();
  stroke(255);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
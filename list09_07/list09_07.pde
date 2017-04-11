PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
  // 画像をウィンドウの大きさにリサイズ
  img.resize(width, height);
}

void draw() {
  background(0);
  // 画面の幅だけ繰り返し
  for (int i = 0; i < width; i++) {
    color col = img.get(i, mouseY); // マウスのY座標の位置のピクセルを取り出す
    stroke(col); // 取得した色を線の色にする
    line(i, 0, i, height); // 縦に線を描く
  }
  // 現在のマウスの場所を線で表示する
  stroke(255);
  line(0, mouseY, width, mouseY);
}
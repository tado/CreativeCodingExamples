PImage img;
void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
}

void draw() {
  background(0);
  //(0, 0)の位置に画面の幅と高さで画像を表示する
  image(img, 0, 0, width, height);
}
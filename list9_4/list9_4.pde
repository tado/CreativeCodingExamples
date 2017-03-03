PImage img;

void setup() {
  size(800, 600); // 画像ファイルを読み込む
  img = loadImage("source.jpg"); // フィルタ:ガウスぼかし
  img.filter(BLUR, 10);
}

void draw() {
  background(0);
  image(img, 0, 0); // フィルタを適用した画像を描画する
}
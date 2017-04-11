PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
}

void draw() {
  background(0);
  tint(127); // 画像の明るさを127にする
  image(img, 0, 0); //(0, 0)の位置に画像を表示する
  noTint(); // 明るさの変更をリセットする
  //(width/2, 0)の位置に画像を表示する(画面の右半分から)
  image(img, width/2, 0);
}
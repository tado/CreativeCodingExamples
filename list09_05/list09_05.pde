PImage img;

void setup() {
  size(800, 600);
  stroke(255);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
  // 画像をウィンドウの大きさにリサイズする
  img.resize(width, height);
}

void draw() {
  background(0);
  image(img, 0, 0); // 画像を表示する
  // マウスポインタの場所の色を取得する
  color col = img.get(mouseX, mouseY);
  fill(col); // 取得した色を塗りの色に指定して円を描画する
  ellipse(50, 50, 80, 80);
  // マウスの場所を線で表示する
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
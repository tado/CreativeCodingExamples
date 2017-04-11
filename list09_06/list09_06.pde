PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
  // 画像をウィンドウの大きさにリサイズする
  img.resize(width, height);
}

void draw() {
  background(0);
  noStroke();
  // マウスの位置で何ピクセルずつスキャンするか変化させる
  int step = int(map(mouseX, 0, width, 1, 100));
  // 画面の行(i)を列の数(j)だけ画像のピクセルをスキャンする
  for (int j = 0; j < height; j += step) {     
    for (int i = 0; i < width; i += step) {
      // 指定した場所の色を取得する
      color col = img.get(i, j);
      // 色を指定して四角形を描く
      fill(col);
      rect(i, j, step, step);
    }
  }
}
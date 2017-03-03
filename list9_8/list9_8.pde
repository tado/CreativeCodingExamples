PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
  // 画像をウィンドウの大きさにリサイズする
  img.resize(width, height);
  background(0); // 背景は一度だけ描画する
}

void draw() {
  noStroke();
  // 毎フレーム40個の円を描く
  for (int i = 0; i < 40; i++) {
    // 画面からランダムな場所を選択する
    PVector location = new PVector(random(width), random(height));
    // 場所に対応する色を画像から取得して塗り潰しの色に設定する
    color col = img.get(int(location.x), int(location.y));
    fill(col, 127);
    // 明るさ(RGBの合計)を計算する
    float brightness = red(col) + green(col) + blue(col);
    // 明るさから円のサイズを設定する
    float diameter = map(brightness, 0, 255*3, 0, 20);
    // 設定した大きさで円を描く
    ellipse(location.x, location.y, diameter, diameter);
  }
}
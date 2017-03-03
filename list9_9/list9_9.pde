PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg"); // 画像ファイルを読み込む
  // 画像をウィンドウの大きさにリサイズ
  img.resize(width, height);
  background(0); // 背景は一度だけ描画する
}

void draw() {
  noStroke();
  rectMode(CENTER);
  // 毎フレーム10個の円を描く
  for (int i = 0; i < 150; i++) {
    // 画面からランダムな場所を選択する
    PVector location = new PVector(random(width), random(height));
    // 場所に対応する色を画像から取得して塗り潰しの色にする
    color col = img.get(int(location.x), int(location.y));
    fill(col, 15);
    // 明るさ(RGBの合計)を計算する
    float brightness = red(col) + green(col) + blue(col);
    // 明るさから角度を設定する
    float angle = map(brightness, 0, 255*3, -PI/2.0, PI/2.0);
    // 明るさから四角形の長さを設定する
    float length = map(brightness, 0, 255*3, 0, 40);
    // 設定した角度と長さで四角形を描く
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, length, 2);
    popMatrix();
  }
}
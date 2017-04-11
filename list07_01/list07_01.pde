// 円の色を格納する変数
color col = color(0, 0, 255);

void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  noStroke();
  fill(col); // 色を設定する
  ellipse(mouseX, mouseY, 100, 100); // マウスポインタの位置を中心に円を描く
}

void mousePressed() {
  col = color(255, 0, 0); // マウスを押すと赤にする
}

void mouseReleased() {
  col = color(0, 0, 255); // マウスを離すと青にする
}
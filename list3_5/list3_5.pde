float angle = 0.0; // 回転角度

// 初期設定
void setup() {
  // 画面初期設定
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
}

// 繰り返し描画
void draw() {
  background(0);
  // 原点(0, 0)を中心に座標全体を回転する
  rotate(angle);
  // 四角形の中心を基準点に300×300の四角形を描く
  rectMode(CENTER);     
  rect(400, 300, 300, 300);
  // 角度を更新する
  angle += 0.1;
}
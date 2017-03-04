import fisica.*; // Fisicaライブラリのインポート  
FWorld world; // FWorldの宣言

void setup() {
  size(800, 600);
  frameRate(60);
  Fisica.init(this); // Fisicaを初期化する
  world = new FWorld(); // FWorldを初期化する
  world.setEdges(); // 上下左右に壁を生成する
}

void draw() {
  background(255);
  world.step(4.0/60.0); // スピードを設定して物理計算を実行する
  world.draw(this); // 物体を描画する
}

// マウスを押すと矩形を追加する
void mouseReleased() {
  float width = random(10, 80); // 幅をランダムに決定する
  float height = random(10, 80); // 高さをランダムに決定する
  // 新規に矩形(FBox)を生成してインスタンス(box)を生成する
  FBox box = new FBox(width, height);
  box.setPosition(mouseX, mouseY); // マウスの位置へ移動する
  box.setRestitution(0.6); // 反発力を0.6にする
  box.setFill(31, 127, 255); // 塗りの色を設定する   
  box.setStroke(31); // 線の色を設定する  
  world.add(box); // Fisicaの世界に追加する
}
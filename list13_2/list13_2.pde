import fisica.*; // Fisicaライブラリのインポート   
FWorld world; // FWorldを宣言する
FPoly poly = null; // ポリゴンを設定する
float speed = 4.0; // スピードを可変にする  

void setup() {
  size(800, 600);
  frameRate(60);
  Fisica.init(this); // Fisicaを初期化する
  world = new FWorld(); // FWorldを初期化する
}

void draw() {
  background(255);
  world.step(speed/60.0); // 物理計算する
  world.draw(this); // 物体を描画する
  if (poly != null) {   
    poly.draw(this); // 描画中のポリゴンを描画する
  }
}

// キーを押すと矩形を追加する
void keyPressed() {
  // もしbキーを押したら
  if (key == 'b') {  
    float width = random(10, 40); // 幅をランダムに決定
    float height = random(10, 40); // 高さをランダムに決定する
    // 新規に矩形(FBox)を生成してインスタンス(box)を生成する
    FBox box = new FBox(width, height);
    box.setPosition(mouseX, mouseY); // マウスの位置へ移動する
    box.setRestitution(0.6); // 反発力を0.6にする
    box.setFill(31, 127, 255); // 塗りの色を設定する
    box.setStroke(31); // 線の色を設定する
    world.add(box); // Fisicaの世界に追加する
  }  
  // もしcキーを押したら
  if (key == 'c') {   
    float radius = random(10, 40); // 幅と高さをランダムに決定する
    // 新規に矩形(FBox)を生成してインスタンス(box)を生成する
    FCircle circle = new FCircle(radius);
    circle.setPosition(mouseX, mouseY); // マウスの位置へ移動する
    circle.setRestitution(0.6); // 反発力を0.6にする
    circle.setFill(255, 127, 31); // 塗りの色を設定する
    circle.setStroke(31); // 線の色を設定する
    world.add(circle); // Fisicaの世界に追加する
  }  
  // もしqキーを押したら
  if (key == 'q') {  
    world.clear(); // すべての物体をクリア
  }
}

void mousePressed() {
  poly = new FPoly(); // 新規にポリゴンを生成する
  poly.setFill(127); // 線と塗りの設定する
  poly.setStatic(true); // 画面に固定する
  poly.vertex(mouseX, mouseY); // 現在のマウスの位置を頂点に指定する
}

void mouseDragged() {
  // もしポリゴンを描画中だったら
  if (poly!=null) {
    poly.vertex(mouseX, mouseY); // 現在のマウスの位置を頂点に指定する
  }
}

void mouseReleased() {
  // もしポリゴンを描画中だったら
  if (poly!=null) {
    world.add(poly); // 描画したポリゴンをworldに追加する
    poly = null; // ポリゴンを新規描画モードにする
  }
}
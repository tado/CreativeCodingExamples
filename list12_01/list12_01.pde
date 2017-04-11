void setup() {
  size(800, 600, P3D); // 画面を設定する
}

void draw() {
  background(0);
  lights(); // ライティングをONにする
  translate(width/2, height/2, 0); // 画面の中心を原点にする
  rotateX(millis()/1000.0 * 1.0); // X軸を中心に回転する
  rotateY(millis()/1000.0 * 1.5); // Y軸を中心に回転する
  fill(255); // 白い立方体を描画する
  noStroke();
  box(200);
}
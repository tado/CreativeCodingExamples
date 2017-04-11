import controlP5.*; // controlP5ライブラリを読み込む
ControlP5 cp5; // controlP5をcp5として宣言する
Slider boxSize; // スライダー:立方体のサイズ
Slider2D rotate; // スライダー2D:回転スピード(x, y)

void setup() {
  size(800, 600, P3D); // 画面を設定する
  cp5 = new ControlP5(this); // controlP5を初期化する
  // スライダーを追加する
  boxSize = cp5.addSlider("BOX SIZE") // スライダー1 : ボックスのサイズ
    .setPosition(20, 20)
    .setRange(0, 400)
    .setValue(200);
  rotate = cp5.addSlider2D("ROTATION") // スライダー2D : 回転スピードXY
    .setPosition(20, 40)
    .setSize(100, 100)
    .setMinMax(1.0, 1.0, 10.0, 10.0)
    .setValue(2.0, 2.0);
}

void draw() {
  background(0);
  pushMatrix();
  lights(); // ライティングをONにする
  translate(width/2, height/2, 0); // 画面の中心を原点にする
  rotateX(millis()/1000.0 * rotate.getArrayValue()[0]); // X軸を中心に回転する
  rotateY(millis()/1000.0 * rotate.getArrayValue()[1]); // Y軸を中心に回転する
  fill(255); // 白い立方体を描画する
  noStroke();
  box(boxSize.getValue());
  popMatrix();
}
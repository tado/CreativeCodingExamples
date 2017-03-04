import controlP5.*; // controlP5ライブラリを読み込む   
ControlP5 cp5; // controlP5をcp5として宣言する   
// スライダーを3つ宣言する
Slider boxSize; // 立方体のサイズ  
Slider rotateX; // 回転スピードX
Slider rotateY; // 回転スピードY  

void setup() {  
  size(800, 600, P3D); // 画面を設定する
  cp5 = new ControlP5(this); // controlP5を初期化する
  // スライダーを追加する
  boxSize = cp5.addSlider("BOX SIZE") // スライダー1 : ボックスのサイズ
    .setPosition(20, 20)
    .setRange(0, 400)
    .setValue(200);
  rotateX = cp5.addSlider("ROTATE X") // スライダー2 : 回転スピードX
    .setPosition(20, 30)
    .setRange(1.0, 10.0)
    .setValue(2.0);
  rotateY = cp5.addSlider("ROTATE Y") // スライダー3 : 回転スピードY
    .setPosition(20, 40)
    .setRange(1.0, 10.0)
    .setValue(2.0);
}

void draw() {  
  background(0);
  pushMatrix();
  lights(); // ライティングをONにする
  translate(width/2, height/2, 0); // 画面の中心を原点にする
  rotateX(millis()/1000.0 * rotateX.getValue()); // X軸を中心に回転する
  rotateY(millis()/1000.0 * rotateY.getValue()); // Y軸を中心に回転する      ❻
  fill(255); // 白い立方体を描画する
  noStroke();
  box(boxSize.getValue());
  popMatrix();
}   
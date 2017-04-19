PVector force; // 力
PVector acceleration; // 加速度
PVector location; // 位置
PVector velocity; // 速度
float mass; // 質量

void setup() {
  size(800, 600);
  frameRate(60);
  // 位置、速度を初期化する
  location = new PVector(0.0, 0.0);
  velocity = new PVector(0.0, 0.0);
  force = new PVector(3.0, 2.0); // (3.0, 2.0)の力を加える
  mass = 1.0; // 質量は1.0に設定する
  acceleration = force.div(mass); // 質量と速度から加速度を算出する
  background(0);
}

void draw() {
  //背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  velocity.add(acceleration); // 加速度から速度を算出する
  location.add(velocity); // 速度から位置を算出する
  acceleration.set(0, 0); // 加速度を0にリセット(等速運動)する
  ellipse(location.x, location.y, 20, 20); // 円を描画する
}
PVector force; // 力
PVector acceleration; // 加速度
PVector location; // 位置
PVector velocity; // 速度
PVector gravity; // 重力
float mass; // 質量
float friction; // 摩擦力
PVector min; // 稼動範囲(min)
PVector max; // 稼動範囲(max)

void setup() {
  size(800, 600);
  frameRate(60);
  // 位置、速度を初期化する
  location = new PVector(0.0, 0.0);
  velocity = new PVector(0.0, 0.0);
  gravity = new PVector(0.0, 1.0); // 下向きに1.0の重力を設定する
  force = new PVector(12.0, 8.0); //(12.0, 8.0)の力を加える
  // 稼動範囲を設定
  min = new PVector(0.0, 0.0);
  max = new PVector(width, height);
  mass = 1.0; // 質量は1.0に設定する
  friction = 0.01; // 摩擦力を0.01に設定する
  acceleration = force.div(mass); // 質量と速度から加速度を算出する
  background(0);
}

void draw() {
  //背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  acceleration.add(gravity); // 重力を加える
  velocity.add(acceleration); // 加速度から速度を算出する
  velocity.mult(1.0 - friction); // 摩擦力から速度を変化させる
  location.add(velocity); // 速度から位置を算出する
  acceleration.set(0, 0); // 加速度を0にリセット(等速運動)する
  ellipse(location.x, location.y, 20, 20); // 円を描画する
  bounceOffWalls(); // 壁でバウンドさせる
}

// 壁のバウンドを計算する  
void bounceOffWalls() {
  if (location.x > max.x) {
    location.x = max.x;
    velocity.x *= -1;
  }
  if (location.x < min.x) {
    location.x = min.x;
    velocity.x *= -1;
  }
  if (location.y > max.y) {
    location.y = max.y;
    velocity.y *= -1;
  }
  if (location.y < min.y) {
    location.y = min.y;
    velocity.y *= -1;
  }
}
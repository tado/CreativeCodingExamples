// 物体の運動を計算(運動方程式)
class ParticleVec2 {
  PVector location; // 位置
  PVector velocity; // 速度
  PVector acceleration; // 加速度
  PVector gravity; // 重力
  float mass; // 質量
  float friction; // 摩擦力
  PVector min; // 稼動範囲(min)
  PVector max; // 稼動範囲(max)
  float radius; // パーティクル半径
  // コンストラクタ
  ParticleVec2() {
    radius = 4.0;
    mass = 1.0; // 質量は1.0に設定する
    friction = 0.01; // 摩擦力を0.01に設定する
    // 位置、速度、加速度を初期化する
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    gravity = new PVector(0.0, 0.0); // 重力なし
    // 稼動範囲を設定する
    min = new PVector(0.0, 0.0);
    max = new PVector(width, height);
  }
  // 運動方程式から位置を更新
  void update() {
    acceleration.add(gravity); // 重力を加える
    velocity.add(acceleration); // 加速度から速度を算出する
    velocity.mult(1.0 - friction); // 摩擦力から速度を変化させる
    location.add(velocity); // 速度から位置を算出する
    acceleration.set(0, 0); // 加速度を0にリセット(等速運動)する
  }
  // 描画
  void draw() {
    ellipse(location.x, location.y, mass * radius * 2, mass * radius * 2);
  }
  // 壁でバウンドさせる
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
  // 壁を突き抜けて反対から出現させる
  void throughWalls() {
    if (location.x < min.x) {
      location.x = max.x;
    }
    if (location.y < min.y) {
      location.y = max.y;
    }
    if (location.x > max.x) {
      location.x = min.x;
    }
    if (location.y > max.y) {
      location.y = min.y;
    }
  }
}
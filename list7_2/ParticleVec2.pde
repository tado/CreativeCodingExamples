//ParticleVec2クラス
//物体の運動を計算(運動方程式)
class ParticleVec2 {
  PVector location; //位置
  PVector velocity; //速度
  PVector acceleration; //加速度
  PVector gravity; //重力
  float mass; //質量
  float friction; //摩擦力
  PVector min; //稼動範囲 min
  PVector max; //稼動範囲 max
  float radius; //パーティクル半径
  float G; //重力定数

  //コンストラクター
  ParticleVec2() {
    radius = 4.0;
    mass = 1.0; //質量は 1.0 に設定
    friction = 0.01; //摩擦力を0.01に設定
    G = 1.0; //重力定数を1.0に
    //位置、速度、加速度を初期化
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    //重力なし
    gravity = new PVector(0.0, 0.0);
    //稼動範囲を設定
    min = new PVector(0.0, 0.0);
    max = new PVector(width, height);
  }

  //運動方程式から位置を更新
  void update() {
    //重力を加える
    acceleration.add(gravity);
    //加速度から速度を算出
    velocity.add(acceleration);
    //摩擦力から速度を変化
    velocity.mult(1.0 - friction);
    //速度から位置を算出
    location.add(velocity);
    //加速度を0にリセット(等速運動)
    acceleration.set(0, 0);
  }

  //描画
  void draw() {
    ellipse(location.x, location.y, mass * radius * 2, mass * radius * 2);
  }

  //壁でバウンドさせる
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

  //壁を突き抜けて反対から出現させる
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
  
  //力を加える
  void addForce(PVector force) {
    force.div(mass); //力と質量から加速度を算出
    acceleration.add(force); //力を加速度に加える
  }

  //引力を計算
  void attract(PVector center, float _mass, float min, float max) {
    //距離を算出
    float distance = PVector.dist(center, location);
    //距離を指定した範囲内に納める(極端な値を無視する)
    distance = constrain(distance, min, max);
    //引力の強さを算出 F = G(Mm/r^2)
    float strength = G * (mass * _mass) / (distance * distance);
    //引力の中心点とパーティクル間のベクトルを作成
    PVector force = PVector.sub(center, location);
    //ベクトルを正規化
    force.normalize();
    //ベクトルに力の強さを乗算
    force.mult(strength);
    //力を加える
    addForce(force);
  }
}
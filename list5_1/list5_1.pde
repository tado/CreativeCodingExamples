int NUM = 1000; // パーティクルの数
Particle[] myParticle = new Particle[NUM]; // Particleクラスの配列

void setup() {
  size(800, 600, P2D); // 800×600ピクセルの画面を生成する
  frameRate(60); // フレームレート
  blendMode(ADD); // 色は加算合成する
  noStroke(); // 枠線はなし
  // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    // Particleオブジェクトを生成して配列に格納する 
    // 直径を乱数で指定する(最小8、最大32ピクセル)
    myParticle[i] = new Particle(random(8, 32));
  }
}

void draw() {
  background(0); // 背景を描画する // 配列の数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    // Particleクラスのdraw()メソッドを実行
    myParticle[i].draw();
  }
}

// Particleクラス 
class Particle {
  color col;
  float diameter; 
  PVector location; 
  PVector velocity;
  Particle(float _diameter) {
    // 大きさの初期設定
    diameter = _diameter;
    // 位置のベクトルの初期設定
    location = new PVector(random(0, width), random(0, height)); 
    // 速度のベクトルの初期設定
    velocity = new PVector(random(-4, 4), random(-4, 4)); 
    // 色の初期設定
    col = color(random(255), random(255), random(255));
  }

  void draw() {
    fill(col); // 色を指定する
    // 指定した位置に円を描画する
    ellipse(location.x, location.y, diameter, diameter);
    // 位置のベクトルに速度のベクトルを加算、次の位置になる 
    location.add(velocity);
    // もし画面の左端、または右端に到達したら
    if ((location.x < 0) || (location.x > width)) {
      velocity.x = velocity.x * -1; // X方向のスピードを反転する
    }
    // もし画面の下端、または上端に到達したら
    if ((location.y < 0) || (location.y > height)) {
      velocity.y = velocity.y * -1; // Y方向のスピードを反転する
    }
  }
}
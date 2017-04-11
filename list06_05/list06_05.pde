int NUM = 1000; // パーティクルの数
// パーティクルを格納する配列
ParticleVec2[] particles = new ParticleVec2[NUM];

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  // パーティクルを初期化する
  for (int i = 0; i < NUM; i++) {
    // クラスをインスタンス化する
    particles[i] = new ParticleVec2();
    // 初期位置は画面の中心にする
    particles[i].location.set(width/2.0, height/2.0);
    // ランダムに加速度を設定する
    particles[i].acceleration.set(random(-10, 10), random(-10, 10));
    // 下向きに0.1の重力にする
    particles[i].gravity.set(0.0, 0.1);
    // 摩擦を0.01にする
    particles[i].friction = 0.01;
  }
}

void draw() {
  //背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  noStroke();
  fill(255);
  // パーティクルの位置を更新して描画する
  for (int i = 0; i < NUM; i++) {
    particles[i].update(); // 位置を更新する
    particles[i].draw(); // 描画する
    particles[i].bounceOffWalls(); // 壁でバウンドさせる
  }
}
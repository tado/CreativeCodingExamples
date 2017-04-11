int NUM = 2000; // パーティクルの数
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
    particles[i].location.set(random(width), random(height));
    // 重力を0.0にする
    particles[i].gravity.set(0.0, 0.0);
    // 摩擦力を0.01にする
    particles[i].friction = 0.01;
  }
}

void draw() {
  //背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  fill(255);
  // パーティクルの位置を更新して描画する
  for (int i = 0; i < NUM; i++) {
    particles[i].update(); // 位置を更新する
    particles[i].draw(); // 描画する
    particles[i].bounceOffWalls(); // 壁でバウンドさせる
  }
}

// マウスドラッグで吸引力を発生させる
void mouseDragged() {
  // パーティクルの数だけ繰り返し
  for (int i = 0; i < NUM; i++) {
    PVector mouseLoc = new PVector(mouseX, mouseY);
    particles[i].attract(mouseLoc, 200, 5, 20);
  }
}
int NUM = 1000; //パーティクルの数
//パーティクルを格納する配列
ParticleVec2[] particles = new ParticleVec2[NUM];

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  //パーティクルを初期化
  for (int i = 0; i < NUM; i++) {
    //クラスをインスタンス化
    particles[i] = new ParticleVec2();
    //初期位置は画面の中心に
    particles[i].location.set(width/2.0, height/2.0);
    //ランダムに加速度を設定 - ランダムの範囲を中央からの距離に
    float angle = random(PI * 2.0);
    float length = random(20);
    float posX = cos(angle) * length;
    float posY = sin(angle) * length;
    particles[i].acceleration.set(posX, posY);
    //下向きに0.1の重力
    particles[i].gravity.set(0.0, 0.1);
    //摩擦を0.01に
    particles[i].friction = 0.01;
  }
}

void draw() {
  //背景をフェードさせる
  fill(0, 31);
  rect(0, 0, width, height);
  noStroke();
  fill(255);
  //パーティクルの位置を更新して描画
  for (int i = 0; i < NUM; i++) {
    //位置を更新
    particles[i].update();
    //描画
    particles[i].draw();
    //壁でバウンドさせる
    particles[i].bounceOffWalls();
  }
}


void mouseReleased() {
  //パーティクルの数だけくりかえし
  for (int i = 0; i < NUM; i++) {
    //ランダムの範囲を中央からの距離に
    float angle = random(PI * 2.0);
    float length = random(20);
    PVector force = new PVector(cos(angle) * length, sin(angle) * length);
    particles[i].addForce(force);
  }
}
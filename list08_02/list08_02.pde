int NUM = 1000; // パーティクルの数
// パーティクルを格納する配列
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  // パーティクルを初期化する
  for (int i = 0; i < NUM; i++) {
    // クラスをインスタンス化する
    particles[i] = new ParticleVec3();
    // 初期位置はランダムにする
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].mass = random(1, 2);
    particles[i].radius = 0.5;
    particles[i].friction = 0.02;
  }
  noStroke();
  background(0);
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  fill(255);
  // パーティクル同士の引き付けあう力を計算する
  for (int i = 0; i < NUM; i++) {
    for (int j = 0; j < i; j++) {
      // パーティクル同士の距離と質量から引力を計算する
      particles[i].attract(particles[j].location, particles[j].mass, 2.0, 800.0);
    }
    particles[i].update();
    // 壁を突き抜けたら反対になる
    particles[i].throughWalls();
    particles[i].draw();
  }
}
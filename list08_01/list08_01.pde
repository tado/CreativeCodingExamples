int ANUM = 20; // アトラクターの数
int NUM = 2000; // パーティクルの数
// アトラクターを格納する配列
ParticleVec3[] attractors = new ParticleVec3[ANUM];
// パーティクルを格納する配列
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  // アトラクターを初期化する
  for (int i = 0; i < ANUM; i++) {
    attractors[i] = new ParticleVec3();
    attractors[i].location.set(random(width), random(height), random(height/2));
    attractors[i].radius = 5.0;
  }
  // パーティクルを初期化する
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].friction = 0.001;
    particles[i].radius = 1.0;
    particles[i].mass = random(2.0);
  }
  background(0);
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  noStroke();
  // アトラクターの数だけ更新する
  for (int j = 0; j < ANUM; j++) {
    // アトラクターを描画する
    fill(255, 0, 0);
    attractors[j].draw();
    for (int i = 0; i < NUM; i++) {
      // アトラクターの場所への吸引力を設定する
      particles[i].attract(attractors[j].location, 50, 10, 800);
    }
  }
  // パーティクルの位置を更新して描画する
  for (int i = 0; i < NUM; i++) {
    fill(255);
    particles[i].update();
    particles[i].draw();
    particles[i].throughWalls();
  }
}
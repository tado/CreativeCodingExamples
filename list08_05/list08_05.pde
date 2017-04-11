int NUM = 2000; // パーティクルの数
// パーティクルを格納する配列
ParticleVec3[] particles = new ParticleVec3[NUM];
float noiseScale;
float noiseStrength;

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  noiseScale = 0.01;
  noiseStrength = 0.1;
  // パーティクルを初期化する
  for (int i = 0; i < NUM; i++) {
    // クラスをインスタンス化する
    particles[i] = new ParticleVec3();
    // 初期位置はランダムな場所にする
    particles[i].location.set(random(width), random(height), random(height/2));
    particles[i].min.set(0, 0, 0);
    particles[i].max.set(width, height, width/2);
    particles[i].gravity.set(0.0, 0.0, 0.0); // 重力を0.0にする
    particles[i].friction = 0.1; // 摩擦力を0.01にする
    particles[i].radius = 1.0; // 半径を2.0にする
  }
  background(255);
}

void draw() {
  noStroke();
  // 動きをフェードさせる
  // fill(0, 9);
  // rect(0, 0, width, height);
  fill(0, 3);
  // パーティクルの位置を更新して描画する
  for (int i = 0; i < NUM; i++) {
    // ノイズによる力学場を生成する
    PVector force = new PVector();
    force.x = cos(noise(particles[i].location.x * noiseScale, 
      particles[i].location.y * noiseScale, 
      particles[i].location.z * noiseScale) * PI * 4.0);
    force.y = sin(noise(particles[i].location.x * noiseScale, 
      particles[i].location.y * noiseScale, 
      particles[i].location.z * noiseScale) * PI * 4.0);
    force.mult(noiseStrength);
    particles[i].addForce(force); // 生成した力をパーティクルに加える
    particles[i].update(); // 位置を更新する
    particles[i].draw(); // 描画する
    particles[i].throughWalls(); // 壁で突き抜けて反対側になる
  }
}

// マウスクリックでノイズと位置を初期化する
void mousePressed() {
  noiseSeed(round(random(1000)));
  noiseScale = 0.01;
  for (int i = 0; i < NUM; i++) {
    particles[i].location.set(random(width), random(height), random(height/2));
  }
  background(255);
}
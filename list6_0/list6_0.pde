int NUM = 4000; //パーティクルの数
//パーティクルを格納する配列
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  //パーティクルを初期化
  for (int i = 0; i < NUM; i++) {
    //クラスをインスタンス化
    particles[i] = new ParticleVec3();
    //初期位置はランダムな場所に
    particles[i].location.set(random(width), random(height), random(-height/2, height/2));
    //重力を0.0に
    particles[i].gravity.set(0.0, 0.0, 0.0);
    //摩擦力を0.01に
    particles[i].friction = 0.01;
  }
  background(0);
}

void draw() {
  blendMode(BLEND);
  fill(0, 31);
  rect(0, 0, width, height);

  blendMode(ADD);
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

//マウスドラッグで吸引力を発生
void mouseDragged() {
  //パーティクルの数だけくりかえし
  for (int i = 0; i < NUM; i++) {
    PVector mouseLoc = new PVector(mouseX, mouseY, 0);
    particles[i].attract(mouseLoc, 20, 5, 10);
  }
}
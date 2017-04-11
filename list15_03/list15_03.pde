import gab.opencv.*; // OpenCVライブラリを読み込む  
import processing.video.*; // ビデオライラリーを読み込む(カメラ入力用)
OpenCV opencv; // OpenCVのインスタンス
Capture video; // ライブカメラ   
int NUM = 2000; // パーティクルの数   
ParticleVec3[] particles = new ParticleVec3[NUM]; // パーティクルの配列   

void setup() {  
  size(640, 480, P3D); // 画面サイズ
  video = new Capture(this, 640/2, 480/2); // キャプチャするカメラのサイズ
  opencv = new OpenCV(this, 640/2, 480/2); // OpenCVの画面サイズ
  video.start(); // キャプチャ開始
  // パーティクルを初期化する
  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].radius = 1.5;
    particles[i].position.set(random(width/2), random(height/2), 0);
    particles[i].minx = 0;
    particles[i].miny = 0;
    particles[i].maxx = width/2;
    particles[i].maxy = height/2;
  }
}   
void draw() { 
  background(0);
  blendMode(ADD);
  scale(2.0);
  opencv.loadImage(video); // カメラの画像をOpenCVに読み込む
  opencv.calculateOpticalFlow(); // OpticalFlowを計算する
  stroke(255, 0, 0); // 描画設定する
  opencv.drawOpticalFlow(); // OpticalFlowを描画する
  // パーティクルを演算する
  noStroke();
  fill(0, 127, 255);
  for (int i = 0; i < NUM; i++) {
    particles[i].update(); // パーティクルの位置を更新して描画する
    particles[i].draw();
    particles[i].throughOffWalls(); // 画面の端にきたら反対側から出現する
    // もしパーティクルが画面内にあったら
    if (particles[i].position.x > 0 && particles[i].position.x < video.width
      && particles[i].position.y > 0 && particles[i].position.y < video.height ) {
      // 現在のパーティクルの場所のオプティカルフローのベクトルを取得する
      PVector vec = opencv.getFlowAt(int(particles[i].position.x), int(particles[i]. position.y));
      // 取得したベクトルの力をパーティクルに加える
      particles[i].addForce(vec.mult(0.1));
    }
  }
}
// キャプチャイベント
void captureEvent(Capture c) {
  c.read();
}
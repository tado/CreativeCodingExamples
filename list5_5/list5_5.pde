DrawEllipse myCircle; // オブジェクトmyCircleの準備

void setup() {
  size(800, 600);
  // DrawEllipseクラスをインスタンス化して、
  // myCircleオブジェクトを生成する
  // コンストラクタにdiameterとloactionを指定する
  myCircle = new DrawEllipse(400, new PVector(width/2, height/2));
}

void draw() {
  // myCircleクラスのdraw()を呼び出し
  myCircle.draw();
}

// DrawEllipseクラスの宣言
class DrawEllipse {
  // データ(変数)
  float diameter;
  PVector location;
  
  // コンストラクタ
  DrawEllipse(float _diameter, PVector _location) {
    diameter = _diameter;
    location = _location;
  }
  
  // メソッド1
  void draw() {
    ellipse(location.x, location.y, diameter, diameter);
  }
}
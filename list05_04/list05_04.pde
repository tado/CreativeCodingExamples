DrawEllipse myCircle; // オブジェクトmyCircleの準備

void setup() {
  size(800, 600);
  // DrawEllipseクラスをインスタンス化して、
  // myCircleオブジェクトを生成する
  myCircle = new DrawEllipse();
  // myCircleクラスのsetup()を呼び出し
  myCircle.setup();
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

  // メソッド1
  void setup() {
    diameter = 400;
    location = new PVector(width/2, height/2);
  }

  // メソッド2
  void draw() {
    ellipse(location.x, location.y, diameter, diameter);
  }
}
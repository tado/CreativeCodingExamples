DrawEllipse myCircle0; // 1つ目の円
DrawEllipse myCircle1; // 2つ目の円

void setup() {
  size(800, 600);
  // 半径と位置を指定して、2つのオブジェクトを生成する
  myCircle0 = new DrawEllipse(300, new PVector(300, 300));
  myCircle1 = new DrawEllipse(150, new PVector(500, 500));
}

void draw() {
  // それぞれの円を描く
  myCircle0.draw();
  myCircle1.draw();
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
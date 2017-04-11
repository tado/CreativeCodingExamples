ArrayList<Bubble> bubbles; // Bubbleクラスを格納するArrayList
PImage img; // 色をピックアップするイメージ
int maxSize = 60; // 円の最大サイズ(直径)

void setup() {
  // 画面初期設定
  size(800, 600);
  frameRate(60);
  noStroke();
  // ArrayListの初期化
  bubbles = new ArrayList<Bubble>();
  // 画像を読み込んで、画面の大きさにリサイズ
  // 画像の名前は読み込んだ画像に変更する
  img = loadImage("source.jpg");
  img.resize(width, height);
  // 最初のきっかけの円を描画する
  for (int i = 0; i < 10; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}

void draw() {
  background(0);
  // ArrayListに格納された数だけBubbleを描画する
  for (int i = 0; i < bubbles.size(); i++) {
    bubbles.get(i).draw();
  }
  // Bubbleの状態を更新する
  for (int i = 0; i < bubbles.size(); i++) {
    // もしアクティブな状態だったら
    if (bubbles.get(i).isDead == false) {
      // 円の周囲のピクセルの色を確認する
      boolean expand = bubbles.get(i).checkPixel();
      // もしこれ以上膨張できない場合
      if (expand == false) {
        // 新規にBubbleを生成する
        PVector loc;
        // 余白が見つかるまで繰り返し
        while (true) {
          loc = new PVector(random(width), random(height));
          color c = get(int(loc.x), int(loc.y));
          if ((red(c) + blue(c) + green(c)) == 0) break;
        }
        // 余白に新規Bubbleを生成する
        bubbles.add(new Bubble(loc));
        bubbles.get(i).isDead = true;
      }
    }
  }
}

// マウスクリックで初期化
void mouseClicked() {
  // ArrayListをクリアする
  bubbles.clear();
  // きっかけの円を描画する
  for (int i = 0; i < 100; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}
// Bubbleクラス
// 円が膨張しながら空間を充填していく
class Bubble {
  float size; // 円のサイズ(直径)
  float expandSpeed; // 膨張スピード
  color circleColor; // 円の色
  PVector location; // 中心の位置
  boolean expand; // 膨張中か否か
  boolean isDead; // 活動している状態か否か
  // コンストラクタ
  Bubble(PVector _location) {
    location = _location; // 位置を引数から取得
    // パラメータの初期値設定
    size = 0;
    expandSpeed = 4.0;
    expand = true;
    isDead = false;
    // 読み込んだ画像から中心位置と同じピクセルの色を取得する
    circleColor = img.get(int(location.x), int(location.y));
  }
  // 円を描画する
  void draw() {
    // もし膨張中なら
    if (expand == true) {
      // 指定した速度で膨張する
      size += expandSpeed;
    }
    // 円を描画する
    fill(circleColor);
    ellipse(location.x, location.y, size, size);
  }
  // 円の周囲のピクセルの色を取得して、膨張する余地があるかを判断する
  boolean checkPixel() {
    // 次のフレームでのサイズを計算する
    float nextSize = size + expandSpeed;
    for (float i = 0; i < TWO_PI; i += 0.01) {
      // 円の周囲の座標を取得する
      int x = int(cos(i) * nextSize / 2.0 + location.x);
      int y = int(sin(i) * nextSize / 2.0 + location.y);
      // 取得した座標の直下のピクセルの色を取得する
      color c = get(x, y);
      // 色が黒以外、もしくは最大サイズを超えていたら膨張を中止する
      if ((red(c) + blue(c) + green(c)) > 0 || size > maxSize) {
        expand = false;
      }
    }
    return expand; // 現在の膨張の状態を返す
  }
}
float diameter;
float hue;

// 初期設定
void setup() {
  // 画面初期設定
  size(800, 600);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

// 繰り返し描画
void draw() {
  // 背景を描画して前のフレームを消去する
  background(0);
  // 円の直径をsin()で変化させる
  diameter = 400 + sin(frameCount * 0.1) * 200;
  // 円の色相をsin()で変化させる
  hue = sin(frameCount * 0.1) * 120;  
  // 色を設定する
  fill(hue, 100, 100);
  // 円を描画する
  ellipse(width/2, height/2, diameter, diameter);
}
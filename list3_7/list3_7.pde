float angle = 0.0; // 回転角度

// 初期設定
void setup() {
  // 画面初期設定
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
}

// 繰り返し描画
void draw() {
  background(0);
  
  // 回転1
  translate(width/4, height/4);
  rotate(angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  
  // 回転2
  translate(width/2, height/2);
  rotate(angle);
  rectMode(CENTER);
  rect(0, 0, 200, 200);
  
  // 角度を更新する
  angle += 0.1;
}
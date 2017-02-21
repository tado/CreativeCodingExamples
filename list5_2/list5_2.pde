PVector location; // 位置ベクトル 
PVector velocity; // 速度ベクトル

void setup() {
  size(800, 600, P2D); // 800×600ピクセルの画面を生成
  frameRate(60); // フレームレート
  noStroke(); // 枠線はなし
  // 位置のベクトルの初期設定
  location = new PVector(random(width), random(height));
  // 速度のベクトルの初期設定
  velocity = new PVector(random(-4, 4), random(-4, 4));
}

void draw() {
  background(0); // 背景を描画する
  fill(255); // 色を指定する
  // 指定した位置に円を描画する
  ellipse(location.x, location.y, 20, 20);
  
  // 位置のベクトルに速度のベクトルを加算する
  // 次のフレームの位置になる
  location.add(velocity);
  
  // 画面の端でバウンドする
  // もし画面の左端、または右端に到達したら
  if (location.x < 0 || location.x > width) {
    // X方向のスピードを反転(バウンド)させる
    velocity.x = velocity.x * -1;
  }
  // もし画面の下端、または上端に到達したら
  if (location.y < 0 || location.y > height) {
    // Y方向のスピードを反転(バウンド)させる
    velocity.y = velocity.y * -1;
  }
}
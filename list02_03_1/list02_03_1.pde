size(800, 600);
background(0);
noStroke();
int num = 1000;

// 100回繰り返し
for (int i = 0; i < num; i++) {
  float x = random(0, width); // 画面の幅いっぱいに生成した値をX座標にする
  float y = random(0, height); // 画面の高さいっぱいに生成した値をY座標にする
  // 生成したランダムな位置と画面の中心との距離を計算する
  float dist = dist(x, y, width/2, height/2);
  
  // もし、距離が高さの半分よりも小さかったら
  if (dist < height/2) {
    noStroke(); // 線はなし
    fill(63, 127, 255); //塗りの色を設定する
  }
  // もし、距離が高さの半分よりも小さくなかったら
  else {
    noFill(); // 塗りはなし
    stroke(31, 127, 255); //線の色を設定する
  }
  ellipse(x, y, 10, 10);
}
// setup()とdraw()で共通して使用する変数  
int locationX; // X座標の現在位置
int direction; // 移動する向き(-1 or 1) 

// 初期設定
void setup() {  
  // 画面初期設定
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
  // X座標の初期値を0にする
  locationX = 0;
  // 向きの初期値を-1にする
  direction = -1;
} 

// 繰り返し描画
void draw() {
  // 背景を描画して前のフレームを消去する
  background(0);     
  ellipse(locationX, height/2, 20, 20);
  // 現在の向きに10移動した場所を、新たなX座標にする
  locationX = locationX + 10 * direction;
  // もしX座標が0より小さいか、または画面の幅より大きければ
  if (locationX < 0 || locationX > width) {  
    // 向きを逆方向にする
    direction = direction * -1;
  }
}
import oscP5.*;
import netP5.*;
OscP5 oscP5; // OSCP5クラスのインスタンス
PVector mouseLoc; // マウスの位置ベクトル

void setup() {
  size(800, 600);
  frameRate(60);
  // ポートを12000に設定して新規にOSCP5のインスタンスを生成する
  oscP5 = new OscP5(this, 12000);
  // マウスの位置ベクトルを初期化する
  mouseLoc = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  // OSCで指定された座標に円を描く
  noFill();
  stroke(255);
  ellipse(mouseLoc.x, mouseLoc.y, 10, 10);
}

// OSCメッセージを受信した際に実行するイベント
void oscEvent(OscMessage theOscMessage) {
  // もしOSCメッセージが /mouse/position だったら
  if (theOscMessage.checkAddrPattern("/mouse/position")==true) {   
    // 最初の値をint型としてX座標にする
    mouseLoc.x = theOscMessage.get(0).intValue();
    // 次の値をint型としてY座標にする
    mouseLoc.y = theOscMessage.get(1).intValue();
  }
}
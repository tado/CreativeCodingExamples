import oscP5.*; // OSC関連のライブラリをインポート
import netP5.*;
OscP5 oscP5; // OSCP5クラスのインスタンス
NetAddress myRemoteLocation; // OSC送出先のネットアドレス

void setup() {
  size(800, 600);
  frameRate(60);
  // ポートを12000に設定して新規にOSCP5のインスタンスを生成する
  oscP5 = new OscP5(this, 12001);
  // OSC送信先のIPアドレスとポートを指定する
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}

void draw() {
  background(0);
  // マウスの場所に円を描く
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, 10, 10);
  // 現在のマウスの位置をOSCで送出
  OscMessage myMessage = new OscMessage("/mouse/position");
  myMessage.add(mouseX); // X座標の位置を追加する
  myMessage.add(mouseY); // Y座標の位置を追加する
  oscP5.send(myMessage, myRemoteLocation); // OSCメッセージを送信する
}

// マウスを押した際にOSCを送信する
void mousePressed() {
  OscMessage myMessage = new OscMessage("/mouse/click");
  myMessage.add(1); // 押した合図を追加する
  myMessage.add(mouseX); // X座標の位置を追加する
  myMessage.add(mouseY); // Y座標の位置を追加する
  oscP5.send(myMessage, myRemoteLocation); // OSCメッセージを送信する
}

// マウスを離した際に別のOSCを送信する
void mouseReleased() {
  OscMessage myMessage = new OscMessage("/mouse/click");
  myMessage.add(0); // 離した合図を追加する
  oscP5.send(myMessage, myRemoteLocation); // OSCメッセージを送信する
}
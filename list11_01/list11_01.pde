import processing.video.*; // ビデオライブラリのインポート
Movie movie; // ムービープレイヤの宣言
boolean playing; // ムービーを再生しているか否か

void setup() {
  size(853, 480); // 画面初期設定
  frameRate(60);
  background(0);
  noStroke();
  // 再生するムービーを読み込む(読み込んだファイル名に変更)
  movie = new Movie(this, "movie.mov");
  movie.loop(); // ループ再生をONにする
  playing = true; // ムービーの再生状態をTrueにする
}

void draw() {
  image(movie, 0, 0, width, height); // ムービーを画面に描画する
  // 現在どこまで再生されたかを表示する。再生された割合は0.0~1.0
  float percent = movie.time() / movie.duration();
  // 再生された割合からバーの長さを計算する
  float length = map(percent, 0.0, 1.0, 0.0, width);
  fill(255, 0, 0); // バーを表示する
  rect(0, height-4, length, 4);
}

// ムービーのフレームが更新されたらイベントを実行する
void movieEvent(Movie m) {  
  m.read(); // 現在のフレームを読み込む
}   

// マウスクリックで再生をON/OFFにする
void mouseReleased() {
  if (playing == true) {
    // もし再生状態なら一時停止する
    movie.pause();
    playing = false;
  } else {
    // 再生状態でなければ再生する
    movie.play();
    playing = true;
  }
}
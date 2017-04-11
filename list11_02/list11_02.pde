import processing.video.*; // ビデオライブラリのインポート
Movie movie; // ムービープレイヤの宣言
boolean playing; // ムービーを再生しているか否か

void setup() {
  size(853, 480); // 画面初期設定
  frameRate(60);
  noStroke();
  // 再生するムービーを読み込む(読み込んだファイル名に変更)
  movie = new Movie(this, "movie.mov");
  movie.loop(); // ループ再生をONにする
  playing = true; // ムービーの再生状態をTrueにする
}

void draw() {
  background(0);
  int skip = 20; // 色をピックアップする間隔を設定する
  // 設定した間隔で画面をスキャン
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = movie.get(i, j); // 指定した座標の色を読み込む
      float br = brightness(col); // 明るさを抽出する
      fill(col); // 塗りの色を設定する
      // 明るさをサイズにして円を描く
      ellipse(i, j, skip * br / 255.0, skip * br / 255.0);
    }
  }
}

// ムービーのフレームが更新されたらイベントを実行する
void movieEvent(Movie m) {
  movie.read(); // 現在のフレームを読み込む
}

// マウスクリックで再生をON/OFFする
void mouseReleased() {
  if (playing == true) {
    // もし再生状態なら一時停止する
    movie.pause();
    playing = false;
  } else {// 再生状態でなければ再生する
    movie.play();
    playing = true;
  }
}
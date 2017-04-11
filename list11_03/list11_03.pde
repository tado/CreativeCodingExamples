import processing.video.*; // ビデオライブラリのインポート
Movie movie; // ムービープレイヤの宣言
boolean playing; // ムービーを再生しているか否か

void setup() {
  size(853, 480, P2D); // 画面初期設定
  frameRate(60);
  noStroke();
  // 再生するムービーを読み込む(読み込んだファイル名に変更)
  movie = new Movie(this, "movie.mov");
  movie.loop(); // ループ再生をONにする
  playing = true; // ムービーの再生状態をTrueにする
}

void draw() {
  background(0);
  rectMode(CENTER);
  // 色をピックアップする間隔を設定
  int skip = 10;// 設定した間隔で画面をスキャン
  for (int j = skip/2; j < height; j += skip) {
    for (int i = skip/2; i < width; i += skip) {
      color col = movie.get(i, j); // 指定した座標の色を読み込む
      float br = brightness(col); // 明るさを抽出する
      fill(col, 127); // 塗りの色を設定する
      pushMatrix(); // 座標を移動して回転する
      translate(i, j);
      float angle = map(br, 0, 255, 0, PI);
      rotate(angle);
      // 明るさをサイズにして四角形を描く
      rect(0, 0, skip * br / 32.0, skip/2.0);
      popMatrix();
    }
  }
}

// ムービーのフレームが更新されたらイベント実行
void movieEvent(Movie m) {
  movie.read(); // 現在のフレームを読み込む
}

// マウスクリックで再生をON/OFFにする
void mouseReleased() {
  if (playing == true) {
    movie.pause(); // 再生状態なら一時停止する
    playing = false;
  } else {
    movie.play(); // 再生状態でなければ再生する
    playing = true;
  }
}
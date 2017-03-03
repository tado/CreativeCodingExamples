//サウンドライブラリーのインポート
import processing.sound.*;
//ビデオライブラリーのインポート
import processing.video.*;

//オーディオインプット
AudioIn input;
//カメラのインプット
Capture cam;
//FFT(高速フーリエ変換)
FFT fft;
//FFTサイズ
int bands = 64;
//FFT解析結果を保存する配列
float[] sum = new float[bands];
//スムージングの細かさ
float smooth_factor = 0.1;
//変化の全体スケール
float scale = 8.0;

public void setup() {
  size(800, 500, P3D);
  frameRate(60);
  blendMode(ADD);
  //ビデオキャプチャーの初期化
  cam = new Capture(this, width, height);
  cam.start();
  //オーディオインプットの初期化
  input = new AudioIn(this, 0);
  input.start();
  //FFTの初期化
  fft = new FFT(this, bands);
  fft.input(input);
}

public void draw() {
  background(0);
  noFill();
  strokeWeight(2.0);
  //FFT解析
  fft.analyze();
  for (int i = 0; i < bands; i++) {
    //解析結果をスムージングをして配列に保存
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
  }
  //ビデオ解析の粒度を設定
  float hStep = height / float(bands) / 2.0;
  float wStep = 4.0;
  int n;
  //上半分の映像
  //カウンターリセット
  n = 0;
  for (float j = height/2; j > 0; j -= hStep) {
    //線の描画開始
    beginShape();
    for (float i = 0; i < width; i += wStep) {
      //色を取得
      color col = cam.get(int(i), int(j));
      //明度を計算
      float br = brightness(col);
      //線の色を設定
      stroke(col);
      //明さとFFT解析の結果から高さを決定して頂点を追加
      vertex(i, j, br * sqrt(sum[n]) * scale);
    }
    //線の描画終了
    endShape();
    n++;
  }
  //下半分の映像
  //カウンターリセット
  n = 0;
  for (float j = height/2 + hStep; j < height; j += hStep) {
    //線の描画開始
    beginShape();
    for (float i = 0; i < width; i += wStep) {
      //色を取得
      color col = cam.get(int(i), int(j));
      //明度を計算
      float br = brightness(col);
      //線の色を設定
      stroke(col);
      //明さとFFT解析の結果から高さを決定して頂点を追加
      vertex(i, j, br * sqrt(sum[n]) * scale);
    }
    //線の描画終了
    endShape();
    n++;
  }
}

//カメラのフレームが更新されたらイベント実行
void captureEvent(Capture c) {
  cam.read();
}
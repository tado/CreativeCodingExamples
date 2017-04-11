void setup() {
  size(800, 600);
  noStroke();
  int step = 5; // 5×5ピクセルの精度でノイズを計算する
  float noiseScale = 0.02; // パーリンノイズのスケール
  // 2次元のパーリンノイズの生成
  for (int j = 0; j < height; j += step) {
    for (int i = 0; i < width; i += step) {
      float gray = noise(i * noiseScale, j * noiseScale) * 255;
      // ノイズの値をグレースケールにして四角形を描画する
      fill(gray);
      rect(i, j, step, step);
    }
  }
}
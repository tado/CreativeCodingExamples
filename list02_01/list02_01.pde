size(800, 600);
colorMode(HSB, 360, 100, 100, 100);

background(0);
noStroke();

// 円の直径をfloat型で格納する
float diameter;
// 色相、明度、彩度、透明度をfloat型で格納する
float hue, saturation, brightness, alpha;
// 色を格納する変数
color col;

// 色の値(HSBA)を代入する
hue = 200;
saturation = 100;
brightness = 20;
alpha = 90;
diameter = width / 2; // 円の直径の値を画面の半分に設定する
col = color(hue, saturation, brightness, alpha); // 色を生成して代入する
fill(col); // 設定した色を塗りの色にする
ellipse(width / 8, height / 2, diameter, diameter); // 円を描く

brightness += 20; // 色の明度を20増加させ、塗りの色にする
col = color(hue, saturation, brightness, alpha); // 色を生成して代入する
fill(col); // 設定した色を塗りの色にする
ellipse(width / 8 * 3, height / 2, diameter, diameter); // 円を描く

brightness += 20; // 色の明度を20増加させ、塗りの色にする
col = color(hue, saturation, brightness, alpha); // 色を生成して代入する
fill(col); // 設定した色を塗りの色にする
ellipse(width / 8 * 5, height / 2, diameter, diameter); // 円を描く

brightness += 20; // 色の明度を20増加させ、塗りの色にする
col = color(hue, saturation, brightness, alpha); // 色を生成して代入する
fill(col); // 設定した色を塗りの色にする
ellipse(width / 8 * 7, height / 2, diameter, diameter); // 円を描く
import controlP5.*;
ControlP5 slider;

//左側の渦巻き
float Ltheta = 5 * PI;
float Rtheta = 3.5 * PI;
float topLtheta;//渦巻の最高点の時のθ
float bottomRtheta;//渦巻の最下点の時のθ
float Lmin_height = 0; //左の渦巻きの最高点を求める時
float Rmin_height = 0; //右の渦巻きの最高点を求める時
float Lmax_height = 0; //左の渦巻きの最低点を求める時
float Rmax_height = 0; //右の渦巻きの最低点を求める時
int Lspiral, Rspiral;
float La= 1.1;
float Ra= 1.1;
float Lb, Rb;
float Latranslate, Ratranslate;
float Lrr, Rrr;
float Lr, Rr;
float Lx, Ly, Rx, Ry;
float last_Lspiral, last_Rspiral;
float last_Lb, last_Rb;
float last_Latranslate, last_Ratranslate;
float last_Lrr, last_Rrr;
float origin_Lrr, origin_Rrr;
float origin_Rx;
float LmaxR, RmaxR;
Slider slider_Lspiral, slider_Rspiral;
Slider slider_Lb, slider_Rb;
Slider slider_Latranslate, slider_Ratranslate;
Slider slider_Lrr, slider_Rrr;
Slider slider_Lr, slider_Rr;
Slider slider_Rx;

//ベジェ（茎）
float sbXl, sbYl, sbXr, sbYr;
float greenXl, greenXr;

//曲線の精度
float STEP = 2 * PI * 0.01;

//直径Lrr, Rrrのどちらを変化させたかの指標
//rr = 1の時はLrrを変化させた後ということを表し、rr = 2の時はRrrを変化させた後ということを表す
int rr = 0;
int last_rr = 0;

//ベジェ（葉）
float lbl, lbr;//葉を動かす変数
float origin_lbl, origin_lbr;
int lpattern;//左側の葉の数
int rpattern;//右側の葉の数
//1枚目の葉用
float RcirXrU, RcirYrU;
float RcirXrB, RcirYrB;
//2枚目の葉用
float RcirXt, RcirYt;
float RcirXl, RcirYl;
float RcirXb, RcirYb;
Slider slider_lbl, slider_lbr;
Slider slider_lpattern, slider_rpattern;

//UI
//巻き数
float LspcenX, LspcenY;
float RspcenX, RspcenY;
//直径
float LcenX, LcenY;
float RcenX, RcenY;
float Ldia;
float Rdia;
//比率
float LrtcenX, LrtcenY;
float RrtcenX, RrtcenY;
float Lrtdia;
float Rrtdia;
//内径
float LincenX, LincenY;
float RincenX, RincenY;
float Lindia;
float Rindia;
//葉数
float ltcenX,ltcenY;
float llcenX,llcenY;
float lrcenX,lrcenY;
float rlcenX,rlcenY;
float rtcenX,rtcenY;
float rbcenX,rbcenY;
//葉
float A,B,C,D,E,Ed,F,Fd,G,H,A1,B1,A2,B2,PX,PY,I,J,K,L,M,O,P,lcenX,lcenY,ldia;
float Al,Bl,Cl,Dl,El,Eld,Fl,Fld,Gl,Hl,Al1,Bl1,Al2,Bl2,PlX,PlY,Il,Jl,Kl,Ll,Ml,Ol,Pl,lcenlX,lcenlY,lldia;
//その他
color c;
String prm;
float last_mouseX, last_mouseY;
int qdr;//第何象限でドラッグを始めたか
boolean ui = true;
float LcirX0, LcirY0, RcirX0, RcirY0;
float RcirX01, RcirY01;
float LcirX05, LcirY05, RcirX05, RcirY05;
float LcirX1, LcirY1, RcirX1, RcirY1;
float RcirX125, RcirY125;
float RcirX15, RcirY15;
float RcirX2, RcirY2, LcirX2, LcirY2;
float RcirX25, RcirY25;
int Lcount, Rcount;

void setup(){
  size(1000,800);
  colorMode(RGB,255);
  background(255);
  
  //コントローラを生成
  slider = new ControlP5(this);
  
  //左側の渦巻き
  //Lspiralの値を動かすスライダー
  slider_Lspiral = slider.addSlider("Lspiral")
   .setPosition(10,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,2)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lbの値を動かすスライダー
  slider_Lb = slider.addSlider("Lb")
   .setPosition(10,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,5)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Latranslateの値を動かすスライダー
  slider_Latranslate = slider.addSlider("Latranslate")
   .setPosition(10,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0.25, 0.5)  //最小値と最大値
   .setValue(0.45)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lrrの値を動かすスライダー
  slider_Lrr = slider.addSlider("Lrr")
   .setPosition(10,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(0.5,1.3)  //最小値と最大値(計算された値)
   .setValue(0.8)  //初期値
   ;
  //Lr：直径
  slider_Lr = slider.addSlider("Lr")
   .setPosition(width-120,130)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(3)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lxの値を動かすスライダー
  slider.addSlider("Lx")
   .setPosition(width-120,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-400, 400)  //最小値と最大値
   .setValue(-150)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lyの値を動かすスライダー
  slider.addSlider("Ly")
   .setPosition(width-120,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-height/2, height/2)  //最小値と最大値
   .setValue(-42)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   
  //右側の渦巻き
  //Rspiralの値を動かすスライダー
  slider_Rspiral = slider.addSlider("Rspiral")
   .setPosition(170,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,2)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Rbの値を動かすスライダー
  slider_Rb = slider.addSlider("Rb")
   .setPosition(170,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,5)  //最小値と最大値
   .setValue(5)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Ratranslateの値を動かすスライダー
  slider_Ratranslate = slider.addSlider("Ratranslate")
   .setPosition(170,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0.25, 0.5)  //最小値と最大値
   .setValue(0.4)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Rrrの値を動かすスライダー 
  slider_Rrr = slider.addSlider("Rrr")
   .setPosition(170,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(0.75,1.95)  //最小値と最大値(計算された値)
   .setValue(1.3)  //初期値
   ;
  //Rr：直径
  slider_Rr = slider.addSlider("Rr")
   .setPosition(width-120, 160)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(2.3)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Rxの値を動かすスライダー
  slider_Rx = slider.addSlider("Rx")
   .setPosition(width-120,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-400, 400)  //最小値と最大値
   .setValue(220)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Ryの値を動かすスライダー
  slider.addSlider("Ry")
   .setPosition(width-120,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-height/2, height/2)  //最小値と最大値
   .setValue(-42)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   
  //LmaxR, RmaxR
  LmaxR = Lrr * Lr * (pow(La+((Lspiral-1)*0.1+0.049)*Latranslate,((Lspiral-1)*2+6)*PI-2*STEP)+Lb);
  RmaxR = Rrr * Rr * (pow(Ra+(0.074+0.1*(Rspiral-1))*Ratranslate,(5+2*(Rspiral-1))*PI-2*STEP)+Rb);
  println("L:" + LmaxR);
  println("R:" + RmaxR);
  
  //葉
  //lblの値を動かすスライダー
  slider_lbl = slider.addSlider("lbl")
   .setPosition(330,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(420,485)  //最小値と最大値
   .setValue(460)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //lbrの値を動かすスライダー
  slider_lbr = slider.addSlider("lbr")
   .setPosition(490,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,100)  //最小値と最大値
   .setValue(0)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //lpatternの値を動かすスライダー
  slider_lpattern = slider.addSlider("lpattern")
   .setPosition(330,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,3)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //lpatternの値を動かすスライダー
  slider_rpattern = slider.addSlider("rpattern")
   .setPosition(490,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,3)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  
  //左側の渦巻き
  last_Lspiral = int(slider.getController("Lspiral").getValue());
  last_Lb = slider.getController("Lb").getValue();
  last_Latranslate = slider.getController("Latranslate").getValue();
  last_Lrr = slider.getController("Lrr").getValue();
  origin_Lrr = slider.getController("Lrr").getValue();
  
  //右側の渦巻き
  last_Rspiral = int(slider.getController("Rspiral").getValue());
  last_Rb = slider.getController("Rb").getValue();
  last_Ratranslate = slider.getController("Ratranslate").getValue();
  last_Rrr = slider.getController("Rrr").getValue();
  origin_Rrr = slider.getController("Rrr").getValue();
  origin_Rx = slider.getController("Rx").getValue();
  
  //葉
  origin_lbl = slider.getController("lbl").getValue();
  origin_lbr = slider.getController("lbr").getValue();
}

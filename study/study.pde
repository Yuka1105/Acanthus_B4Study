import controlP5.*;
ControlP5 slider;

//左側の渦巻き
float Ltheta = 5 * PI;
float Rtheta = 3.5 * PI;
float topLtheta;//渦巻の最高点の時のθ
float bottomRtheta;//渦巻の最下点の時のθ
float min_height = 0; //左の渦巻きの最高点を求める時
float Lmax_height = 0; //左の渦巻きの最低点を求める時
float Rmax_height = 0; //右の渦巻きの最低点を求める時
int Lspiral, Rspiral;
float La= 1.1;
float Ra= 1.1;
float Lb, Rb;
float Lr, Rr;
Slider slider_Lr, slider_Rr;
float Lrr, Rrr;
Slider slider_Lrr, slider_Rrr;
float Latranslate, Ratranslate;
float Lx, Ly, Rx, Ry;
float origin_Rx;
Slider slider_Rx;
float last_Lspiral, last_Rspiral;
float last_Lb, last_Rb;
float last_Lrr, last_Rrr;
float origin_Lrr, origin_Rrr;
float last_Latranslate, last_Ratranslate;
float LmaxR, RmaxR;
float max;//LmaxRとRLmaxRの和(これでRxを決定)

//ベジェ（茎）
float sbXl, sbYl, sbXr, sbYr;
float greenXl, greenXr;

//曲線の精度
float STEP = 2 * PI * 0.01;

//直径Lrr, Rrrのどちらを変化させたかの指標
//rr = 1の時はLrrを変化させた後ということを表し、rr = 2の時はRrrを変化させた後ということを表す
int rr = 0;
int last_rr = 0;
//kind = 1の時はLrr、2の時はRrr、3の時はその他のパラメータを変化させた後ということ
int kind = 0;
int last_kind = 0;
float kindLmaxR, kindRmaxR;

//ベジェ（葉）
float lbl;

void setup(){
  size(1000,800);
  colorMode(RGB,255);
  background(255);
  
  //コントローラを生成
  slider = new ControlP5(this);
  
  //左側の渦巻き
  //Lr：直径
  slider_Lr = slider.addSlider("Lr")
   .setPosition(width-120,130)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(2.3)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lspiralの値を動かすスライダー
  slider.addSlider("Lspiral")
   .setPosition(10,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,2)  //最小値と最大値
   .setValue(int(random(1,3)))  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lbの値を動かすスライダー
  slider.addSlider("Lb")
   .setPosition(10,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,10)  //最小値と最大値
   .setValue(random(0,10))  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Latranslateの値を動かすスライダー
  slider.addSlider("Latranslate")
   .setPosition(10,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0.25, 0.5)  //最小値と最大値
   .setValue(random(0.25,0.5))  //初期値
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
  //Rr：直径
  slider_Rr = slider.addSlider("Rr")
   .setPosition(width-120, 160)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(2.3)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Rspiralの値を動かすスライダー
  slider.addSlider("Rspiral")
   .setPosition(170,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,2)  //最小値と最大値
   .setValue(int(random(1,3)))  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Rbの値を動かすスライダー
  slider.addSlider("Rb")
   .setPosition(170,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,10)  //最小値と最大値
   .setValue(random(0,10))  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Ratranslateの値を動かすスライダー
  slider.addSlider("Ratranslate")
   .setPosition(170,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0.25, 0.5)  //最小値と最大値
   .setValue(random(0.25,0.5))  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   
  //渦巻きの大きさとベジェのバランス調整
  if(Rspiral == 1){
    //仮のRrrを決める、仮のRmaxRを求める
    Rrr = 2.5;
    RmaxR = Rrr * Rr * (pow(Ra+0.074*Ratranslate,5*PI-2*STEP)+Rb);
    println("仮のRLmaxR:" +RmaxR);
  }
  else if(Rspiral == 2){
    //仮のRrrを決める、仮のRmaxRを求める
    Rrr = 2;
    RmaxR = Rrr * Rr * (pow(Ra+0.174*Ratranslate,7*PI-2*STEP)+Rb);
    println("仮のRLmaxR:" +RmaxR);
  }
 
  //渦巻きの大きさとベジェのバランス調整
  if(Lspiral == 1){
    //仮のLrrを決める、仮のLmaxRを求める
    Lrr = 2.5;
    LmaxR = Lrr * Lr * (pow(La+0.049*Latranslate,6*PI-2*STEP)+Lb);
    println("仮のLmaxR:" + LmaxR);
  }
  else if(Lspiral == 2){
    //仮のLrrを決める、仮のLmaxRを求める
    Lrr = 2;
    LmaxR = Lrr * Lr * (pow(La+0.149*Latranslate,8*PI-2*STEP)+Lb);
    println("仮のLmaxR:" + LmaxR);
  }

  //仮のLmaxR(RmaxR)の値でLrr(Rrr)の可動域を決める
  //仮のLmaxR、RmaxRが大きいなら衝突を避けるためにLrr(Rrr)の可動域を小さくする
  slider_Lrr = slider.addSlider("Lrr")
   .setPosition(10,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(170/LmaxR, 220/LmaxR + 100/RmaxR)  //最小値と最大値
   .setValue(random(170/LmaxR, (220/LmaxR + 100/RmaxR)))  //初期値
   ;
  slider_Rrr = slider.addSlider("Rrr")
   .setPosition(170,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(170/RmaxR, 250/RmaxR + 100/LmaxR)  //最小値と最大値
   .setValue(random(170/RmaxR, 250/RmaxR + 100/LmaxR))  //初期値
   ;
   
  //ほんとのLmaxR, RmaxR
  LmaxR = Lrr * Lr * (pow(La+((Lspiral-1)*0.1+0.049)*Latranslate,((Lspiral-1)*2+6)*PI-2*STEP)+Lb);
  println("本当のL:" + LmaxR);
  RmaxR = Rrr * Rr * (pow(Ra+(0.074+0.1*(Rspiral-1))*Ratranslate,(5+2*(Rspiral-1))*PI-2*STEP)+Rb);
  println("本当のR:" + RmaxR);
  max = LmaxR +RmaxR;
  println("渦巻の大きさの和：" + max);
  
  //左右の渦巻きの大きさの和(max)でRxを決める
  //Rxの値を動かすスライダー
  slider_Rx = slider.addSlider("Rx")
   .setPosition(width-120,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-400, 400)  //最小値と最大値
   .setValue(-30 + max)  //初期値
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
   
  //葉
  //lblの値を動かすスライダー
  slider.addSlider("lbl")
   .setPosition(330,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(450,520)  //最小値と最大値
   .setValue(480)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  
  //左側の渦巻き
  last_Lspiral = int(slider.getController("Lspiral").getValue());
  last_Lb = slider.getController("Lb").getValue();
  last_Lrr = slider.getController("Lrr").getValue();
  origin_Lrr = slider.getController("Lrr").getValue();
  last_Latranslate = slider.getController("Latranslate").getValue();
  //右側の渦巻き
  last_Rspiral = int(slider.getController("Rspiral").getValue());
  last_Rb = slider.getController("Rb").getValue();
  last_Rrr = slider.getController("Rrr").getValue();
  origin_Rrr = slider.getController("Rrr").getValue();
  origin_Rx = slider.getController("Rx").getValue();
  last_Ratranslate = slider.getController("Ratranslate").getValue();
}

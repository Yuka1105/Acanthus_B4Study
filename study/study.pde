import controlP5.*;
ControlP5 slider;

//左側の渦巻き
float Ltheta = 5 * PI;
float topLtheta;//渦巻の最高点の時のθ
float min_height = 0;
int Lspiral;
float La= 1.1;
float Lb;
float Lr;
Slider slider_Lr;
float Lrr;//直径を制御
Slider slider_Lrr;
float Latranslate;
float Lx, Ly;
float last_Lspiral;
float last_Lb;
float last_Lr;
float last_Lrr;
float origin_Lrr;
float origin_Lrr_fors1;
float last_Latranslate;
float LmaxR;

//右側の渦巻き
float Rtheta = 3.5 * PI;
float bottomRtheta;//渦巻の最下点の時のθ
float max_height = 0;
int Rspiral;
float Ra= 1.1;
float Rb;
float Rr;
Slider slider_Rr;
float Rrr;//直径を制御
Slider slider_Rrr;
float Ratranslate;
float Rx, Ry;
float origin_Rx;
Slider slider_Rx;
float last_Rspiral;
float last_Rb;
float last_Rr;
float last_Rrr;
float origin_Rrr;
float last_Ratranslate;
float RLmaxR;

//LmaxRとRLmaxRの和　これでRxを場合分け
float max;

//ベジェ
int count;//ベジェの終点を定める
float bezierXl;
float bezierYl;
float bezierXr;
float bezierYr;
float greenX;
float s1, s3;
float origin_s1;
float origin_s3;
Slider slider_s1;
Slider slider_s3;

//曲線の精度
float STEP = 2 * PI * 0.01;

//直径Lrr, Rrrのどちらを変化させたかの指標
//rr = 1の時はLrrを変化させた後ということを表し、rr = 2の時はRrrを変化させた後ということを表す
int rr = 0;
int last_rr = 0;

void setup(){
  size(800,800);
  colorMode(RGB,255);
  background(255);
  
  //コントローラを生成
  slider = new ControlP5(this);
  
  //左側の渦巻き
  //Lr：直径
  slider_Lr = slider.addSlider("Lr")
   .setPosition(680,height-60)  //スライダーの位置
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
   
  //渦巻きの大きさとベジェのバランス調整
  if(int(slider.getController("Lspiral").getValue()) == 1){
    //とりあえずのLrrを決める、とりあえずのLmaxRを求める
    Lrr = 2.5;
    LmaxR = Lrr * Lr * (pow(La+0.049*Latranslate,6*PI-2*STEP)+Lb);
    println("仮のLmaxR:" + LmaxR);
  }
  else if(int(slider.getController("Lspiral").getValue()) == 2){
    //とりあえずのLrrを決める、とりあえずのLmaxRを求める
    Lrr = 2;
    LmaxR = Lrr * Lr * (pow(La+0.149*Latranslate,8*PI-2*STEP)+Lb);
    println("仮のLmaxR:" + LmaxR);
  }
  
  //Lrrスライダーの不変部分だけ作ってしまう
  slider_Lrr = slider.addSlider("Lrr")
   .setPosition(10,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(1,3)  //最小値と最大値
   ;
   
  //s1の値を動かすスライダー
  slider_s1 = slider.addSlider("s1")
   .setPosition(680,height-120)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-1000,1000)  //最小値と最大値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   
  //LmaxRの値でLrrの可動域を決める
  if(LmaxR > 0 && LmaxR < 90){
    //LmaxRが小さいならLrrの可動域を大きくする
    slider_Lrr
     .setRange(1,4)  //最小値と最大値
     .setValue(random(1,4))  //初期値
     ;
    //ほんとのLmaxR
    LmaxR = Lrr * Lr * (pow(La+((Lspiral-1)*0.1+0.049)*Latranslate,((Lspiral-1)*2+6)*PI-2*STEP)+Lb);
    println("L:" + LmaxR);
    
    //s1の値を動かすスライダー
    slider_s1
     .setValue(0.45*LmaxR + 245 + Lrr*Lrr);  //初期値
  }
  else if(LmaxR >= 90 && LmaxR < 140){
    //LmaxRが中くらいならLrrの可動域を中くらいにする
    slider_Lrr
     .setRange(1,3)  //最小値と最大値
     .setValue(random(1,3))  //初期値
     ;
    //ほんとのLmaxR
    LmaxR = Lrr * Lr * (pow(La+((Lspiral-1)*0.1+0.049)*Latranslate,((Lspiral-1)*2+6)*PI-2*STEP)+Lb);
    println("L:" + LmaxR);
    
    //s1の値を動かすスライダー
    slider_s1
     .setValue(0.47*LmaxR + 250 + Lrr*Lrr*Lrr);  //初期値
  }
  else if(LmaxR >= 140){
    //LmaxRが大きいならLrrの可動域を小さくする
    slider_Lrr
     .setRange(1,2)  //最小値と最大値
     .setValue(random(1,2))  //初期値
     ;
    //ほんとのLmaxR
    LmaxR = Lrr * Lr * (pow(La+((Lspiral-1)*0.1+0.049)*Latranslate,((Lspiral-1)*2+6)*PI-2*STEP)+Lb);
    println("L:" + LmaxR);
    
    //s1の値を動かすスライダー
    slider_s1
     .setValue(0.6*LmaxR + 270 + Lrr*Lrr*Lrr*Lrr*Lrr);  //初期値
  }
  //s3の値を動かすスライダー
  slider_s3 = slider.addSlider("s3")
   .setPosition(680,height-90)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-1000,1000)  //最小値と最大値
   .setValue(0.69*LmaxR + 310)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;

  //Lxの値を動かすスライダー
  slider.addSlider("Lx")
   .setPosition(680,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-width/2, width/2)  //最小値と最大値
   .setValue(-200)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lyの値を動かすスライダー
  slider.addSlider("Ly")
   .setPosition(680,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-height/2, height/2)  //最小値と最大値
   .setValue(-42)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  
  //右側の渦巻き
  //Rr：直径
  slider_Rr = slider.addSlider("Rr")
   .setPosition(680, height-30)  //スライダーの位置
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
  if(int(slider.getController("Rspiral").getValue()) == 1){
    //とりあえずのRrrを決める、とりあえずのRLmaxRを求める
    Rrr = 2.5;
    RLmaxR = Rrr * Rr * (pow(Ra+0.074*Ratranslate,5*PI-2*STEP)+Rb);
    println("仮のRLmaxR:" + RLmaxR);
  }
  else if(int(slider.getController("Rspiral").getValue()) == 2){
    //とりあえずのRrrを決める、とりあえずのRLmaxRを求める
    Rrr = 2;
    RLmaxR = Rrr * Rr * (pow(Ra+0.174*Ratranslate,7*PI-2*STEP)+Rb);
    println("仮のRLmaxR:" + RLmaxR);
  }
  
  //Rrrスライダーの不変部分だけ作ってしまう
  slider_Rrr = slider.addSlider("Rrr")
   .setPosition(170,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setColorCaptionLabel(0)  //スライダーの文字の色
   .setRange(1,3)  //最小値と最大値
   ;
  
  //RLmaxRの値でRrrの可動域を決める
  if(RLmaxR > 0 && RLmaxR < 90){
    //RLmaxRが小さいならRrrの可動域を大きくする
    slider_Rrr
     .setRange(1,4)  //最小値と最大値
     .setValue(random(1,4))  //初期値
     ;
    //ほんとのRLmaxR
    RLmaxR = Rrr * Rr * (pow(Ra+(0.074+0.1*(Rspiral-1))*Ratranslate,(5+2*(Rspiral-1))*PI-2*STEP)+Rb);
    println("R:" + RLmaxR);
  }
  else if(RLmaxR >= 90 && RLmaxR < 140){
    //RLmaxRが中くらいならRrrの可動域を中くらいにする
    slider_Rrr
     .setRange(1,3)  //最小値と最大値
     .setValue(random(1,3))  //初期値
     ;
    //ほんとのRLmaxR
    RLmaxR = Rrr * Rr * (pow(Ra+(0.074+0.1*(Rspiral-1))*Ratranslate,(5+2*(Rspiral-1))*PI-2*STEP)+Rb);
    println("R:" + RLmaxR);
  }
  else if(RLmaxR >= 140){
    //RLmaxRが大きいならRrrの可動域を小さくする
    slider_Rrr
     .setRange(1,2)  //最小値と最大値
     .setValue(random(1,2))  //初期値
     ;
    //ほんとのRLmaxR
    RLmaxR = Rrr * Rr * (pow(Ra+(0.074+0.1*(Rspiral-1))*Ratranslate,(5+2*(Rspiral-1))*PI-2*STEP)+Rb);
    println("R:" + RLmaxR);
  }
  
  max = LmaxR + RLmaxR;
  println("渦巻の大きさの和：" + max);
  
  //左右の渦巻きの大きさの和(max)でベジェの長さとなるRxを場合分け
  //Rxの値を動かすスライダー
  slider_Rx = slider.addSlider("Rx")
   .setPosition(680,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-width/2, width/2)  //最小値と最大値
   .setValue(-100 + max)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  
  //Ryの値を動かすスライダー
  slider.addSlider("Ry")
   .setPosition(680,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(-height/2, height/2)  //最小値と最大値
   .setValue(-42)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  
  //左側の渦巻き
  last_Lspiral = int(slider.getController("Lspiral").getValue());
  last_Lb = slider.getController("Lb").getValue();
  last_Lr = 1.5;
  last_Lrr = slider.getController("Lrr").getValue();
  origin_Lrr = slider.getController("Lrr").getValue();
  origin_Lrr_fors1 = slider.getController("Lrr").getValue();
  last_Latranslate = slider.getController("Latranslate").getValue();
  //右側の渦巻き
  last_Rspiral = int(slider.getController("Rspiral").getValue());
  last_Rb = slider.getController("Rb").getValue();
  last_Rr = 1.5;
  last_Rrr = slider.getController("Rrr").getValue();
  origin_Rrr = slider.getController("Rrr").getValue();
  origin_Rx = slider.getController("Rx").getValue();
  last_Ratranslate = slider.getController("Ratranslate").getValue();
  //ベジェ
  origin_s1 = slider.getController("s1").getValue();
  origin_s3 = slider.getController("s3").getValue();
}

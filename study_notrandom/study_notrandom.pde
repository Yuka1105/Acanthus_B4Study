import controlP5.*;
ControlP5 slider;
Slider slider_Lr;
Slider slider_s1;
Slider slider_s3;

float STEP = 2 * PI * 0.01;//曲線の精度
//左側の渦巻き
float Ltheta = 4 * PI;
float origin_Ltheta = 4 * PI;
float min_height = 0;
int Lspiral;//巻数
float La= 1.1;
float Lb;//内径
float Lr;//直径制御
float Lrr = 1;//直径
float Latranslate;
float Lx , Ly;//位置
float last_Lspiral = 2;
float last_Lb = 0;
float last_Lr = 3;
float last_Lrr = 1;
float last_Latranslate = 0;
float maxR = 32.9;

//ベジェ
int count;//ベジェの終点を定めるための変数
float bezierXl;
float bezierYl;
float bezierXr;
float bezierYr;
float s1, s3;

void setup(){
  size(800,800);
  colorMode(RGB,255);
  background(255);
  
  //コントローラを生成
  slider = new ControlP5(this);
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
  //Lspiralの値を動かすスライダー
  slider.addSlider("Lspiral")
   .setPosition(10,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,3)  //最小値と最大値
   .setValue(2)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lbの値を動かすスライダー
  slider.addSlider("Lb")
   .setPosition(10,40)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,5)  //最小値と最大値
   .setValue(0)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   //Lr：直径
  slider_Lr = slider.addSlider("Lr")
   .setPosition(width/2+50,660)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(3)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   //Lrrの値を動かすスライダー
  slider.addSlider("Lrr")
   .setPosition(10,70)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,4)  //最小値と最大値
   .setValue(1)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
   //Latranslate：比率
  slider.addSlider("Latranslate")
   .setPosition(10,100)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 0.5)  //最小値と最大値
   .setValue(0)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //s1の値を動かすスライダー
  slider_s1 = slider.addSlider("s1")
   .setPosition(width/2+50,600)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,500)  //最小値と最大値
   .setValue(275)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //s3の値を動かすスライダー
  slider_s3 = slider.addSlider("s3")
   .setPosition(width/2+50,630)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0,500)  //最小値と最大値
   .setValue(320)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
}

void draw(){
  
  //直径Lrrを変化させたときベジェs1,s3の値も変化させる
  if(last_Lrr > Lrr || last_Lrr < Lrr){
    slider_s1.setValue(275 + 20*Lrr);
    slider_s3.setValue(320 + 10*Lrr);
  }
  
  origin_Ltheta = Ltheta;
  min_height = height/2 - Ly + 10; // +10はLr=0の時でもbezierXl、bezierYlが更新されるようにするため
  //直径を変えずに巻き数や内径や比率を変える
  if(last_Lspiral > Lspiral || last_Lspiral < Lspiral || last_Lb > Lb || last_Lb < Lb || last_Latranslate > Latranslate || last_Latranslate < Latranslate){
    slider_Lr.setValue(maxR/((pow(La+(Latranslate*0.001*(Lspiral*2*PI+4*PI-origin_Ltheta))/STEP,Lspiral*2*PI+4*PI)+Lb)*Lrr));
  }
  //背景
  fill(255);
  rect(0,0,width,height);
  //左側の渦巻き
  for(int i = 0; i<(Lspiral*2*PI+4*PI - origin_Ltheta)/STEP; i++){
   noFill();
   stroke(0);
   line(Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx,
    Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly,
    Lradnext(Ltheta + STEP)*cos(Ltheta + STEP)+width/2 + Lx,
    Lradnext(Ltheta + STEP)*sin(Ltheta + STEP)+height/2 - Ly
    );
   //ベジェの始点
   if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly < min_height){
     min_height = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     bezierXl = Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx;
     bezierYl = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
   }
   //ベジェの終点
   if(Ltheta > 4.5*PI+(Lspiral-1)*2*PI && count == 0){
     bezierXr = Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx;
     bezierYr = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     fill(0,255,0);
     noStroke();
     ellipse(bezierXr,bezierYr,5,5);
     count ++;
   }
   //直径Lrrを変えた時maxRが更新される
   if(i == (Lspiral*2*PI+4*PI - origin_Ltheta)/STEP - 1){
     if(last_Lrr> Lrr || last_Lrr < Lrr){
         maxR =Lradnext(Ltheta + STEP);
     }
   }
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  
  //間の曲線
  stroke(255, 102, 0);
  line(bezierXl,bezierYl,s1,bezierYl);
  line(s3,bezierYr,450,bezierYr);
  stroke(0);
  bezier(bezierXl, bezierYl, s1, bezierYl, s3, bezierYr, 450, bezierYr);
  
  //一番高い点の描画（青）
  fill(0,0,255);
  noStroke();
  ellipse(bezierXl,bezierYl,5,5);
  
  
  //値をリセットまたはスライダーの値に
  Ltheta = 4 * PI;
  La = 1.1;
  Lspiral = int(slider.getController("Lspiral").getValue());
  Lb = slider.getController("Lb").getValue();
  Lx = slider.getController("Lx").getValue();
  Ly = slider.getController("Ly").getValue();
  Lr = slider.getController("Lr").getValue();
  Lrr = slider.getController("Lrr").getValue();
  Latranslate = slider.getController("Latranslate").getValue();
  count = 0;
  
  last_Lspiral = Lspiral;
  last_Lb = Lb;
  last_Lr = Lr;
  last_Latranslate = Latranslate;
  last_Lrr = Lrr;
}

//左側の動径を定める関数
float Lrad(float t){
  float r =Lrr* Lr * (pow(La, t) + Lb);//対数らせん
  return(r);
}
float Lradnext(float t){
  float Lanext = La + Latranslate * 0.001;
  float r =Lrr* Lr * (pow(Lanext, t) + Lb);//対数らせん
  return(r);
}

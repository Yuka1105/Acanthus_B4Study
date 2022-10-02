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
int Lspiral;
float La= 1.1;
float Lb;
float Lr;
float Lrr;//直径を制御するためだけの変数
float Latranslate;
float Lx , Ly;
float last_Lspiral;
float last_Lb;
float last_Lr;
float last_Lrr;
float last_Latranslate;
float origin_Lrr; //ランダム後追記
int draw = 1; //ランダム後追記
float maxR; //ランダム後変更
int maxR_abc = 0; //ランダム後追記
//ベジェ
int count;//ベジェの終点を定めるための変数
float bezierXl;
float bezierYl;
float bezierXr;
float bezierYr;
float s1, s3;
float origin_s1; //ランダム後追記
float origin_s3; //ランダム後追記

void setup(){
  size(800,800);
  colorMode(RGB,255);
  background(255);
  
  //コントローラを生成
  slider = new ControlP5(this);
  //Lr：直径
  slider_Lr = slider.addSlider("Lr")
   .setPosition(width/2+50,660)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(0, 30)  //最小値と最大値
   .setValue(1)  //初期値
   .setColorCaptionLabel(0)  //スライダーの文字の色
   ;
  //Lspiralの値を動かすスライダー
  slider.addSlider("Lspiral")
   .setPosition(10,10)  //スライダーの位置
   .setSize(100,20)  //スライダーのサイズ
   .setRange(1,3)  //最小値と最大値
   .setValue(int(random(1,4)))  //初期値
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
  //渦巻きの大きさとベジェのバランス調整
  if(int(slider.getController("Lspiral").getValue()) == 1){
    //Latranslate：比率
    slider.addSlider("Latranslate")
     .setPosition(10,70)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0, 0.5)  //最小値と最大値
     .setValue(random(0,0.2))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //Lrrの値を動かすスライダー
    slider.addSlider("Lrr")
     .setPosition(10,100)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(4,7)  //最小値と最大値
     .setValue(random(4,7))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    maxR= Lrr * Lr * (pow(La+0.1*Latranslate,4*PI+100*STEP)+Lb);
  }
  else if(int(slider.getController("Lspiral").getValue()) == 2){
    //Latranslate：比率
    slider.addSlider("Latranslate")
     .setPosition(10,70)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0, 0.5)  //最小値と最大値
     .setValue(random(0,0.3))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //Lrrの値を動かすスライダー
    slider.addSlider("Lrr")
     .setPosition(10,100)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(1,4)  //最小値と最大値
     .setValue(random(1,3.5))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    maxR= Lrr * Lr * (pow(La+0.2*Latranslate,4*PI+200*STEP)+Lb);
  }
  else if(int(slider.getController("Lspiral").getValue()) == 3){
    //Latranslate：比率
    slider.addSlider("Latranslate")
     .setPosition(10,70)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0, 0.5)  //最小値と最大値
     .setValue(random(0,0.2))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //Lrrの値を動かすスライダー
    slider.addSlider("Lrr")
     .setPosition(10,100)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(1,4)  //最小値と最大値
     .setValue(random(1,1.5))  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    maxR= Lrr * Lr * (pow(La+0.3*Latranslate,4*PI+300*STEP)+Lb);
  }
  println(maxR);
  //maxRの値でベジェの位置を決める
  if(maxR > 20 && maxR < 50){
    //s1の値を動かすスライダー
    slider_s1 = slider.addSlider("s1")
     .setPosition(width/2+50,600)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(240)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //s3の値を動かすスライダー
    slider_s3 = slider.addSlider("s3")
     .setPosition(width/2+50,630)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(265)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    maxR_abc=1;
    println("小さい");
  }
  else if(maxR >= 50 && maxR < 80){
    //s1の値を動かすスライダー
    slider_s1 = slider.addSlider("s1")
     .setPosition(width/2+50,600)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(270)  //初期値
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
    maxR_abc=2;
    println("中くらい");
  }
  else if(maxR >= 80 && maxR < 130){
    //s1の値を動かすスライダー
    slider_s1 = slider.addSlider("s1")
     .setPosition(width/2+50,600)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(325)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //s3の値を動かすスライダー
    slider_s3 = slider.addSlider("s3")
     .setPosition(width/2+50,630)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(315)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    maxR_abc=3;
    println("大きい");
  }
  else{
    //s1の値を動かすスライダー
    slider_s1 = slider.addSlider("s1")
     .setPosition(width/2+50,600)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(390)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
    //s3の値を動かすスライダー
    slider_s3 = slider.addSlider("s3")
     .setPosition(width/2+50,630)  //スライダーの位置
     .setSize(100,20)  //スライダーのサイズ
     .setRange(0,500)  //最小値と最大値
     .setValue(395)  //初期値
     .setColorCaptionLabel(0)  //スライダーの文字の色
     ;
     maxR_abc=4;
     println("超でかい");
  }

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

  last_Lspiral = int(slider.getController("Lspiral").getValue());
  last_Lb = slider.getController("Lb").getValue();
  last_Lrr = slider.getController("Lrr").getValue();
  last_Latranslate = slider.getController("Latranslate").getValue();
  last_Lr = 1;
  origin_Lrr = slider.getController("Lrr").getValue();
  println(origin_Lrr);
  origin_s1 = slider.getController("s1").getValue();
  origin_s3 = slider.getController("s3").getValue();
}

void draw(){
  
  //直径Lrrを変化させたときベジェs1,s3の値も変化させる
  if(last_Lrr > Lrr || last_Lrr < Lrr){
    if(maxR_abc == 1){
      //10*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 15*Lrr- 15*origin_Lrr);
      slider_s3.setValue(origin_s3 + 10*Lrr - 10*origin_Lrr);
    }
    if(maxR_abc == 2){
      //10*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 20*Lrr- 20*origin_Lrr);
      slider_s3.setValue(origin_s3 + 15*Lrr - 15*origin_Lrr);
    }
    if(maxR_abc == 3){
      //10*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 30*Lrr- 30*origin_Lrr);
      slider_s3.setValue(origin_s3 + 20*Lrr - 20*origin_Lrr);
    }
    else{
      //10*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 25*Lrr- 25*origin_Lrr);
      slider_s3.setValue(origin_s3 + 15*Lrr - 15*origin_Lrr);
    }
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
   strokeWeight(1);
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
     ellipse(bezierXr,bezierYr,7,7);
     count ++;
   }
   //直径Lrrを変えた時maxRが更新される
   if(Lspiral == 1){
     if(i == 99){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           maxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   else{
     if(i == (Lspiral*2*PI+4*PI - origin_Ltheta)/STEP - 1){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           maxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  
  //間の曲線
  stroke(255, 102, 0);
  strokeWeight(1);
  line(bezierXl,bezierYl,s1,bezierYl);
  line(s3,bezierYr,400,bezierYr);
  stroke(0);
  bezier(bezierXl, bezierYl, s1, bezierYl, s3, bezierYr, 400, bezierYr);
  
  //一番高い点の描画（青）
  fill(0,0,255);
  noStroke();
  ellipse(bezierXl,bezierYl,7,7);
  
  //値をリセットまたはスライダーの値に
  Ltheta = 4 * PI;
  Lspiral = int(slider.getController("Lspiral").getValue());
  Lb = slider.getController("Lb").getValue();
  Lrr = slider.getController("Lrr").getValue();
  Latranslate = slider.getController("Latranslate").getValue();
  Lx = slider.getController("Lx").getValue();
  Ly = slider.getController("Ly").getValue();
  Lr = slider.getController("Lr").getValue();
  La = 1.1;
  count = 0;
  
  last_Lspiral = Lspiral;
  last_Lb = Lb;
  last_Lrr = Lrr;
  last_Latranslate = Latranslate;
  last_Lr = Lr;
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

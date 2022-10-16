void draw(){
  
  //背景
  fill(255);
  rect(0,0,width,height);
  
  //直径Lrrを変化させたときベジェs1,s3,bezierXr,Rxの値も変化させる
  if(last_Lrr > Lrr || last_Lrr < Lrr){
    if(maxR_abc == 1){//渦巻きが小さい
      //X*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 16*Lrr- 16*origin_Lrr);
      slider_s3.setValue(origin_s3 + 10*Lrr - 10*origin_Lrr);
      slider_Rx.setValue(origin_Rx + 15*Lrr - 15*origin_Lrr);
      //bezierXr = 390 + 25*Lrr- 25*origin_Lrr;
    }
    if(maxR_abc == 2){//渦巻きが中くらい
      //X*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 18*Lrr- 18*origin_Lrr);
      slider_s3.setValue(origin_s3 + 15*Lrr - 15*origin_Lrr);
      slider_Rx.setValue(origin_Rx + 18*Lrr - 18*origin_Lrr);
      //bezierXr = 440 + 23*Lrr- 23*origin_Lrr;
    }
    if(maxR_abc == 3){//渦巻きが大きい
      //X*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_s1.setValue(origin_s1 + 24*Lrr- 24*origin_Lrr);
      slider_s3.setValue(origin_s3 + 20*Lrr - 20*origin_Lrr);
      slider_Rx.setValue(origin_Rx + 20*Lrr - 20*origin_Lrr);
      //bezierXr = 500 + 20*Lrr- 20*origin_Lrr;
    }
  }
  //直径Rrrを変化させたときRxの値も変化させる
  if(last_Rrr > Rrr || last_Rrr < Rrr){
    if(RmaxR_abc == 1){//渦巻きが小さい
      //X*origin_Rrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_Rx.setValue(origin_Rx + 15*Rrr - 15*origin_Rrr);
    }
    if(RmaxR_abc == 2){//渦巻きが中くらい
      //X*origin_Rrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_Rx.setValue(origin_Rx + 18*Rrr - 18*origin_Rrr);
    }
    if(RmaxR_abc == 3){//渦巻きが大きい
      //X*origin_Rrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
      slider_Rx.setValue(origin_Rx + 20*Rrr - 20*origin_Rrr);
    }
  }
  
  min_height = height/2 - Ly + 10; // +10はLr=0の時でもbezierXl、bezierYlが更新されるようにするため
  max_height = height/2 - Ry - 10;
  
  //左側の渦巻き：直径は一定で、巻き数、内径、比率を変える
  if(last_Lspiral > Lspiral || last_Lspiral < Lspiral || last_Lb > Lb || last_Lb < Lb || last_Latranslate > Latranslate || last_Latranslate < Latranslate){
    slider_Lr.setValue(maxR/((pow(La+(Latranslate*0.001*(Lspiral*2*PI-PI))/STEP,(Lspiral*2*PI-PI)+5*PI)+Lb)*Lrr));
  }
  
  //右側の渦巻き：直径は一定で、巻き数、内径、比率を変える
  if(last_Rspiral > Rspiral || last_Rspiral < Rspiral || last_Rb > Rb || last_Rb < Rb || last_Ratranslate > Ratranslate || last_Ratranslate < Ratranslate){
    slider_Rr.setValue(RmaxR/((pow(Ra+Ratranslate*0.001*((Rspiral*2*PI-0.5*PI)/STEP-1),(Rspiral*2*PI-0.5*PI)+3.5*PI-2*STEP)+Rb)*Rrr));
  }
  
  //左側の渦巻き：最初に渦巻きの最高点を求めておいて、その後その点まで描画する（なのでfor文2つ必要になる）
  for(int i = 0; i<(Lspiral*2*PI-PI)/STEP; i++){
   //ベジェの始点
   if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly < min_height){
     min_height = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     bezierXl = Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx;
     bezierYl = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     topLtheta = Ltheta;
   }
   //ベジェの終点
   if(Ltheta > 5*PI+(Lspiral-1)* 1.5*PI && count == 0){
     if(Lspiral == 1){
       greenX = Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx;
       //bezierYr = height/2 - Ly + maxR/2;
     }
     else if(Lspiral == 2){
       greenX = Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx;
       //bezierYr = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     }
     //fill(0,255,0);
     //noStroke();
     //ellipse(greenX,bezierYr,7,7);
     count ++;
   }
   //直径Lrrを変えた時maxRが更新される(変わりゆくLaをそのまま使える)
   if(Lspiral == 1){
     if(i == 49){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           maxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   else{
     if(i == (Lspiral*2*PI-PI)/STEP - 1){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           maxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  
  //一旦初期値に戻す
  Ltheta = 5 * PI;
  La = 1.1;
  
  //右側の渦巻き：for文2つ必要
  for(int i = 0; i<(Rspiral*2*PI-0.5*PI)/STEP; i++){
   //最下点を求める
   if(Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry > max_height){
     max_height = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     bottomRtheta = Rtheta;
     bezierXr = Rrad(Rtheta)*cos(Rtheta)+width/2 + Rx;
     bezierYr = max_height;
   }
   //直径Rrrを変えた時RmaxRが更新される(変わりゆくRaをそのまま使える)
   if(Rspiral == 1){
     if(i == 74){
       if(last_Rrr> Rrr || last_Rrr < Rrr){
           RmaxR =Rradnext(Rtheta + STEP);
           println(RmaxR+"R");
       }
     }
   }
   else{
     if(i == (Rspiral*2*PI-0.5*PI)/STEP - 1){
       if(last_Rrr> Rrr || last_Rrr < Rrr){
           RmaxR =Rradnext(Rtheta + STEP);
           println(RmaxR+"R");
       }
     }
   }
   Rtheta += STEP;
   Ra += Ratranslate * 0.001;
  }
  
  //一旦初期値に戻す
  Rtheta = 3.5 * PI;
  Ra = 1.1;
  
  //左側の渦巻き　最高点まで描画
  for(int i = 0; i<(topLtheta-5*PI)/STEP; i++){
   noFill();
   stroke(0);
   strokeWeight(1);
   line(Lrad(Ltheta)*cos(Ltheta)+width/2 + Lx,
    Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly,
    Lradnext(Ltheta + STEP)*cos(Ltheta + STEP)+width/2 + Lx,
    Lradnext(Ltheta + STEP)*sin(Ltheta + STEP)+height/2 - Ly
    );
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  
  //右側の渦巻き　最下点まで描画
  for(int i = 0; i<(bottomRtheta-3.5*PI)/STEP; i++){
   noFill();
   stroke(0);
   strokeWeight(1);
   line(Rrad(Rtheta)*cos(Rtheta)+width/2 + Rx,
    Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry,
    Rradnext(Rtheta + STEP)*cos(Rtheta + STEP)+width/2 + Rx,
    Rradnext(Rtheta + STEP)*sin(Rtheta + STEP)+height/2 - Ry
    );
   Rtheta += STEP;
   Ra += Ratranslate * 0.001;
  }
  
  //ベジェ
  //stroke(255, 102, 0);
  //strokeWeight(1);
  //line(bezierXl,bezierYl,s1,bezierYl);
  //line(s3,bezierYr,bezierXr,bezierYr);
  stroke(0);
  bezier(bezierXl, bezierYl, s1, bezierYl, s3, bezierYr, bezierXr, bezierYr);
  
  //一番高い点の描画（青）
  //fill(0,0,255);
  //noStroke();
  //ellipse(bezierXl,bezierYl,7,7);
  
  //値をリセットまたはスライダーの値に
  //左側の渦巻き
  Ltheta = 5 * PI;
  Lspiral = int(slider.getController("Lspiral").getValue());
  La = 1.1;
  Lb = slider.getController("Lb").getValue();
  Lr = slider.getController("Lr").getValue();
  Lrr = slider.getController("Lrr").getValue();
  Latranslate = slider.getController("Latranslate").getValue();
  Lx = slider.getController("Lx").getValue();
  Ly = slider.getController("Ly").getValue();
  last_Lspiral = Lspiral;
  last_Lb = Lb;
  last_Lr = Lr;
  last_Lrr = Lrr;
  last_Latranslate = Latranslate;
  count = 0;
  //右側の渦巻き
  Rtheta = 3.5 * PI;
  Rspiral = int(slider.getController("Rspiral").getValue());
  Ra = 1.1;
  Rb = slider.getController("Rb").getValue();
  Rr = slider.getController("Rr").getValue();
  Rrr = slider.getController("Rrr").getValue();
  Ratranslate = slider.getController("Ratranslate").getValue();
  Rx = slider.getController("Rx").getValue();
  Ry = slider.getController("Ry").getValue();
  last_Rspiral = Rspiral;
  last_Rb = Rb;
  last_Rr = Rr;
  last_Rrr = Rrr;
  last_Ratranslate = Ratranslate;
}

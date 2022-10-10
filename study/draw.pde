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

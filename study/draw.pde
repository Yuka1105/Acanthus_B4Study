void draw(){
  //背景
  noStroke();
  fill(255);
  rect(0,0,width,height);
  
  //直径Lrrを変化させたときRxの値も変化させる
  if(last_Lrr > Lrr || last_Lrr < Lrr){
    rr = 1;
    //RrrからLrrに切り替わった時、つまりrrが2から1になった時の1回だけorigin_Rx, origin_Rrrを更新
    //Rrrのみの変化の時はorigin_Rxを更新し続けない
    if(last_rr > rr){
      //origin_Rxの値を更新することでLrr, Rrr間でRxの値が飛ぶことを防げる
      origin_Rx = origin_Rx + 40*Rrr - 40*origin_Rrr;
      origin_Rrr = Rrr;
    }
    //X*origin_Lrrを引いておくことで飛躍せずに滑らかにベジェを制御できる
    slider_Rx.setValue(origin_Rx + 60*Lrr - 60*origin_Lrr);//計算された値
  }
  
  //直径Rrrを変化させたときRxの値も変化させる
  if(last_Rrr > Rrr || last_Rrr < Rrr){
    rr = 2;
    if(last_rr < rr && last_rr != 0){//last_rr != 0を書かないと、最初に更新されてしまう
      origin_Rx = origin_Rx + 60*Lrr - 60*origin_Lrr;
      origin_Lrr = Lrr;
    }
    slider_Rx.setValue(origin_Rx + 40*Rrr - 40*origin_Rrr);//計算された値
  }
  
  min_height = height/2 - Ly + 10;//+10はLr=0の時でもsbXl、sbYlが更新されるようにするため
  Lmax_height = height/2 - Ly - 10;
  Rmax_height = height/2 - Ry - 10;
  
  //左側の渦巻き：直径は一定で、巻き数、内径、比率を変える
  if(last_Lspiral > Lspiral || last_Lspiral < Lspiral || last_Lb > Lb || last_Lb < Lb || last_Latranslate > Latranslate || last_Latranslate < Latranslate){
    slider_Lr.setValue(LmaxR/((pow(La+(Latranslate*0.001*(Lspiral*2*PI-PI))/STEP,(Lspiral*2*PI-PI)+5*PI)+Lb)*Lrr));
  }
  
  //右側の渦巻き：直径は一定で、巻き数、内径、比率を変える
  if(last_Rspiral > Rspiral || last_Rspiral < Rspiral || last_Rb > Rb || last_Rb < Rb || last_Ratranslate > Ratranslate || last_Ratranslate < Ratranslate){
    slider_Rr.setValue(RmaxR/((pow(Ra+Ratranslate*0.001*((Rspiral*2*PI-0.5*PI)/STEP-1),(Rspiral*2*PI-0.5*PI)+3.5*PI-2*STEP)+Rb)*Rrr));
  }
  
  //左側の渦巻き：最初に渦巻きの最高点を求めておいて、その後その点まで描画する
  for(int i = 0; i<(Lspiral*2*PI-PI)/STEP; i++){
   
   //下書き（緑の線）
   //noFill();
   //stroke(0,255,0);
   //strokeWeight(1);
   //line(Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx,
   // Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly,
   // Lradnext(Ltheta + STEP)*cos(Ltheta + STEP)+ 400 + Lx,
   // Lradnext(Ltheta + STEP)*sin(Ltheta + STEP)+ height/2 - Ly
   // );
   
   //緑の線の終点
   greenXl = Lradnext(Ltheta + STEP)*cos(Ltheta + STEP)+ 400 + Lx;
   
   //ベジェの始点(最高点を求める)
   if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly < min_height){
     min_height = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     sbXl = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     sbYl = Lrad(Ltheta)*sin(Ltheta)+ height/2 - Ly;
     topLtheta = Ltheta;
   }
   
   ////ベジェの始点(最低点を求める)
   //if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly > Lmax_height){
   //  Lmax_height  = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
   //  lbYl = Lmax_height;
   //}
   
   //直径Lrrを変えた時LmaxRが更新される(変わりゆくLaをそのまま使える)
   if(Lspiral == 1){
     if(i == 49){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           LmaxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   else{
     if(i == (Lspiral*2*PI-PI)/STEP - 1){
       if(last_Lrr> Lrr || last_Lrr < Lrr){
           LmaxR =Lradnext(Ltheta + STEP);
       }
     }
   }
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  
  //一旦初期値に戻す
  Ltheta = 5 * PI;
  La = 1.1;
  
  //右側の渦巻き
  for(int i = 0; i<(Rspiral*2*PI-0.5*PI)/STEP; i++){
   
   //下書き
   //noFill();
   //stroke(0,255,0);
   //strokeWeight(1);
   //line(Rrad(Rtheta)*cos(Rtheta) + 400 + Rx,
   // Rrad(Rtheta)*sin(Rtheta) + height/2 - Ry,
   // Rradnext(Rtheta + STEP)*cos(Rtheta + STEP)+ 400 + Rx,
   // Rradnext(Rtheta + STEP)*sin(Rtheta + STEP)+ height/2 - Ry
   // );
    
   //緑の線の終点
   greenXr = Rradnext(Rtheta + STEP)*cos(Rtheta + STEP)+ 400 + Rx;
   
   //ベジェの始点(最低点を求める)
   if(Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry > Rmax_height){
     Rmax_height = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     bottomRtheta = Rtheta;
     sbXr = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     sbYr = Rmax_height;
   }
   //直径Rrrを変えた時RLmaxRが更新される(変わりゆくRaをそのまま使える)
   if(Rspiral == 1){
     if(i == 74){
       if(last_Rrr> Rrr || last_Rrr < Rrr){
          RmaxR =Rradnext(Rtheta + STEP);
       }
     }
   }
   else{
     if(i == (Rspiral*2*PI-0.5*PI)/STEP - 1){
       if(last_Rrr> Rrr || last_Rrr < Rrr){
          RmaxR =Rradnext(Rtheta + STEP);
       }
     }
   }
   Rtheta += STEP;
   Ra += Ratranslate * 0.001;
  }
  
  //一旦初期値に戻す
  Rtheta = 3.5 * PI;
  Ra = 1.1;
  
  noFill();
  stroke(0);
  strokeWeight(3);
  //左側の渦巻き　最高点まで描画
  for(int i = 0; i<(topLtheta-5*PI)/STEP; i++){
   line(Lrad(Ltheta)*cos(Ltheta) + 400 + Lx,
    Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly,
    Lradnext(Ltheta + STEP)*cos(Ltheta + STEP) + 400 + Lx,
    Lradnext(Ltheta + STEP)*sin(Ltheta + STEP) + 400 - Ly
    );
   Ltheta += STEP;
   La += Latranslate * 0.001;
  }
  //右側の渦巻き　最低点まで描画
  for(int i = 0; i<(bottomRtheta-3.5*PI)/STEP; i++){
   line(Rrad(Rtheta)*cos(Rtheta) + 400 + Rx,
    Rrad(Rtheta)*sin(Rtheta) + height/2 - Ry,
    Rradnext(Rtheta + STEP)*cos(Rtheta + STEP) + 400 + Rx,
    Rradnext(Rtheta + STEP)*sin(Rtheta + STEP) + height/2 - Ry
    );
   Rtheta += STEP;
   Ra += Ratranslate * 0.001;
  }
  
  //ベジェ(茎)
  stroke(0);
  float a = greenXl+150000/(LmaxR*LmaxR)-15;
  float b = greenXr-150000/(RmaxR*RmaxR)+15;
  bezier(sbXl, sbYl, a, sbYl, b, sbYr, sbXr, sbYr);
  //stroke(255, 100, 0);
  //line(sbXl,sbYl,a,sbYl);
  //line(b,sbYr,sbXr,sbYr);
  
  
  //ベジェ（左側の葉:最高点から描画）
  if(lval != 0){
    stroke(0);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.55+lbl*0.2+350);
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.55+lbl*0.2+350);
  }
  if(lval == 2){
    stroke(0);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), 1.05*(LmaxR*0.2+415), 0.71*(LmaxR*lbl*0.002+LmaxR*0.05+lbl*0.9)-RmaxR*0.1, 0.98*(LmaxR*0.6+lbl*0.2+350));
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), 1.05*(LmaxR*0.2+415), 0.71*(LmaxR*lbl*0.002+LmaxR*0.05+lbl*0.9)-RmaxR*0.1, 0.98*(LmaxR*0.6+lbl*0.2+350));
  }
  //ベジェ（右側の葉:最高点から描画）
  if(rval != 0){
    
    for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      float Y = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //stroke(0);
      //ellipse(X,Y,3,3);
    
      if(t == 0.4){//ベジェの途中（t=0.4）から葉を描画
        //微分
        float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
        float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
        //微分値が等しくなるよう、方程式を解いてc,dの値を定める
        float c = (dXt+3*X)/3;
        float d = (dYt+3*Y)/3;
        //以下は自由
        float g = X+lbr*RmaxR*0.45+125;
        float h = Y+lbr*RmaxR*0.45;
        float e = X+50*cos(0.9*lbr)+RmaxR*0.1+105;
        float f = Y+60*sin(lbr)+RmaxR*0.1+10;
        stroke(0);
        bezier(X,Y,c,d,e,f,g,h);
        //stroke(255, 100, 0);
        //line(X,Y,c,d);
        //line(e,f,g,h);
      }
    }
  }
  if(rval == 2){
    
  }
  
  //値をリセットまたはスライダーの値に
  //左側の渦巻き
  Ltheta = 5 * PI;
  La = 1.1;
  Lspiral = int(slider.getController("Lspiral").getValue());
  Lb = slider.getController("Lb").getValue();
  Latranslate = slider.getController("Latranslate").getValue();
  Lrr = slider.getController("Lrr").getValue();
  Lr = slider.getController("Lr").getValue();
  Lx = slider.getController("Lx").getValue();
  Ly = slider.getController("Ly").getValue();
  last_Lspiral = Lspiral;
  last_Lb = Lb;
  last_Latranslate = Latranslate;
  last_Lrr = Lrr;
  //右側の渦巻き
  Rtheta = 3.5 * PI;
  Ra = 1.1;
  Rspiral = int(slider.getController("Rspiral").getValue());
  Rb = slider.getController("Rb").getValue();
  Ratranslate = slider.getController("Ratranslate").getValue();
  Rrr = slider.getController("Rrr").getValue();
  Rr = slider.getController("Rr").getValue();
  Rx = slider.getController("Rx").getValue();
  Ry = slider.getController("Ry").getValue();
  last_Rspiral = Rspiral;
  last_Rb = Rb;
  last_Ratranslate = Ratranslate;
  last_Rrr = Rrr;

  last_rr = rr;
  
  //葉
  lbl = slider.getController("lbl").getValue();
  lbr = slider.getController("lbr").getValue();
}

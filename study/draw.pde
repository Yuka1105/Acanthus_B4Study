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
  
  Lmin_height = height/2 - Ly + 10;//+10はLr=0の時でもsbXl、sbYlが更新されるようにするため
  Rmin_height = height/2 - Ry + 10;//+10はLr=0の時でもsbXl、sbYlが更新されるようにするため
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
   if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly < Lmin_height){
     Lmin_height = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
     sbXl = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     sbYl = Lrad(Ltheta)*sin(Ltheta)+ height/2 - Ly;
     topLtheta = Ltheta;
   }
   
   ////ベジェの始点(最低点を求める)
   //if(Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly > Lmax_height){
   //  Lmax_height  = Lrad(Ltheta)*sin(Ltheta)+height/2 - Ly;
   //  lbYl = Lmax_height;
   //}
   
   //UI
   //比率のY座標を求めるための変数を求める
   if(i > (0.5*PI)/STEP && count3 == 0){
     LcirX05 = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     LcirY05 = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     count3 ++;
   }
   //直径のY座標
   if(i > (2*PI)/STEP && count3 == 1){
     LcenY = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     count3 ++;
   }
   
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
  //UI
  //直径のX座標
  LcenX = sbXl;
  //比率のX,Y座標
  LrtcenX = (sbXl+LcirX05)/2;
  LrtcenY = (LcirY05 + sbYl)/2;
  
  //直径
  Ldia = 2*(LcenY-sbYl);
  //比率の直径
  Lrtdia = LcirY05 - sbYl;
  
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
   
   //ベジェの始点(最高点を求める)
   if(Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry < Rmin_height){
     Rmin_height = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     RcirXt = Rrad(Rtheta)*cos(Rtheta)+ 400 + Rx;
     RcirYt = Rrad(Rtheta)*sin(Rtheta)+ height/2 - Ry - 2500/RmaxR;//RmaxRが大きい時は低く（谷ができるのを避ける）、小さい時は高く(茎にくっつくのを避ける)
   }
   
   //ベジェの始点(最低点を求める)
   if(Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry > Rmax_height){
     Rmax_height = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     bottomRtheta = Rtheta;
     sbXr = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     sbYr = Rmax_height;
   }
   //巻数１の時
   if(i > (0.1*PI)/STEP && count1 == 0){
     RcirXrU = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirYrU = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count1 ++;
   }
   if(i > (0.5*PI)/STEP && count1 == 1){
     RcirXrB = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirYrB = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count1 ++;
   }
   //巻数２の時
   if(i > (0.5*PI)/STEP && count2 == 0){
     RcirXb = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirYb = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     RcirYb = RcirYb - 2500/RmaxR;//RmaxRが大きい時は低く（谷ができるのを避ける）、小さい時は高く(茎にくっつくのを避ける)
     count2 ++;
   }
   if(i > PI/STEP && count2 == 1){
     //UI
     //比率
     RcirX05 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY05 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count2 ++;
   }
   if(i > 1.25*PI/STEP && count2 == 2){
     RcirX125 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY125 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count2 ++;
   }
   if(i > 1.5*PI/STEP && count2 == 3){
     RcirXl = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirYl = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count2 ++;
   }
   if(i > 2.5*PI/STEP && count2 == 4){
     //UI
     //直径のY座標
     RcenY = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     count2 ++;
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
  
  //UI
  //直径のX座標
  RcenX = sbXr;
  //直径
  Rdia = 2*(sbYr-RcenY);
  //比率のX,Y座標
  RrtcenX = (sbXr+RcirX05)/2;
  RrtcenY = (sbYr+RcirY05)/2;
  //比率の直径
  Rrtdia = sbYr-RcirY05;
  
  //一旦初期値に戻す
  Rtheta = 3.5 * PI;
  Ra = 1.1;
  
  noFill();
  stroke(70,190,70);
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
  stroke(70,190,70);
  float a = greenXl+150000/(LmaxR*LmaxR)-15;
  float b = greenXr-150000/(RmaxR*RmaxR)+15;
  bezier(sbXl, sbYl, a, sbYl, b, sbYr, sbXr, sbYr);
  //stroke(255, 100, 0);
  //line(sbXl,sbYl,a,sbYl);
  //line(b,sbYr,sbXr,sbYr);
  
  
  //ベジェ（左側の葉:最高点から描画）
  if(lval != 0){
    stroke(70,190,70);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
  }
  if(lval == 2){
    stroke(70,190,70);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), LmaxR*0.2+415, 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl));
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), 1.05*(LmaxR*0.2+415), 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl));
  }
  //ベジェ（右側の葉:最高点から描画）
  if(rval != 0){
    
    for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      float Y = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //stroke(70,190,70);
      //ellipse(X,Y,3,3);
    
      if(t == 0.3){//ベジェの途中（t=0.4）から葉を描画
        if(Rspiral == 1){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //以下は自由
          //葉の先端
          float g = RcirXrU - 40*Rrr + 0.15*LmaxR - 60;
          float h = ((RcirYrU-d)/(RcirXrU-c))*g+d-c*(RcirYrU-d)/(RcirXrU-c);
          //宙
          float e = RcirXrU - 50*Rrr + 0.15*LmaxR - 60;
          float f = ((RcirYrU-d)/(RcirXrU-c))*e+d-c*(RcirYrU-d)/(RcirXrU-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
        }
        else if(Rspiral == 2){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //以下は自由
          //葉の先端
          float g = RcirXl - 6*Rrr + 0.10*LmaxR - 40;
          float h = ((RcirYt-d)/(RcirXt-c))*g+d-c*(RcirYt-d)/(RcirXt-c);
          //宙
          float e = RcirXl - 15*Rrr + 0.10*LmaxR - 40;
          float f = ((RcirYt-d)/(RcirXt-c))*e+d-c*(RcirYt-d)/(RcirXt-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
        }
      }
    }
  }
  if(rval == 2){

    for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      float Y = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //stroke(70,190,70);
      //ellipse(X,Y,3,3);
    
      if(t == 0.4){//ベジェの途中（t=0.4）から葉を描画
        if(Rspiral == 1){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //以下は自由
          //葉の先端
          float g = RcirXrB - 40*Rrr + 0.05*LmaxR - 50;
          float h = ((RcirYrB-d)/(RcirXrB-c))*g+d-c*(RcirYrB-d)/(RcirXrB-c);
          //宙
          float e = RcirXrB - 50*Rrr + 0.05*LmaxR - 50;
          float f = ((RcirYrB-d)/(RcirXrB-c))*e+d-c*(RcirYrB-d)/(RcirXrB-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
        }
        else if(Rspiral == 2){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //以下は自由
          //葉の先端
          float g = RcirX125 - 8*Rrr + 0.05*LmaxR - 25;
          float h = ((RcirYb-d)/(RcirXb-c))*g+d-c*(RcirYb-d)/(RcirXb-c);
          //宙
          float e = RcirX125 - 16*Rrr + 0.05*LmaxR - 25;
          float f = ((RcirYb-d)/(RcirXb-c))*e+d-c*(RcirYb-d)/(RcirXb-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
        }
      }
    } 
  }
  
  //UI
  if(ui == true){//UIが表示の時
    noStroke();
    fill(100,100,255,30);
    ellipse(LcenX,LcenY,Ldia,Ldia);
    ellipse(RcenX,RcenY,Rdia,Rdia);
    fill(255,100,100,60);
    ellipse(LrtcenX,LrtcenY,Lrtdia,Lrtdia);
    ellipse(RrtcenX,RrtcenY,Rrtdia,Rrtdia);
    //println("r:"+red(c),"g:"+green(c)+"b:"+blue(c));
  }
  
  //現在のマウスの位置の色取得
  c = get(mouseX,mouseY);
  
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
  count1 = 0;
  count2 = 0;
  
  //UI
  count3 = 0;
  last_mouseX = mouseX;
  last_mouseY = mouseY;
}

//スペースキーが押された時UIの表示非表示を切り替える
void keyPressed(){
  if (key == ' '){
    if(ui == true){
      ui = false;
    }
    else{
      ui = true;
    }
  }
}

void mousePressed(){
  //紫ならば
  if(red(c)==237 && green(c)==237 && blue(c)==255){
    //左側の渦巻きならば
    if(dist(mouseX,mouseY,LcenX,LcenY) <= Ldia/2){
      prm = "左直径";
      
      //何象限でドラッグを始めたか
      if(LcenX < mouseX && LcenY > mouseY){
        qdr = 1;
      }
      else if(LcenX > mouseX && LcenY > mouseY){
        qdr = 2;
      }
      else if(LcenX > mouseX && LcenY < mouseY){
        qdr = 3;
      }
      else if(LcenX < mouseX && LcenY < mouseY){
        qdr = 4;
      }
    }
    else if(dist(mouseX,mouseY,RcenX,RcenY) <= Rdia/2){
      prm = "右直径";
      
      //何象限でドラッグを始めたか
      if(RcenX < mouseX && RcenY > mouseY){
        qdr = 1;
      }
      else if(RcenX > mouseX && RcenY > mouseY){
        qdr = 2;
      }
      else if(RcenX > mouseX && RcenY < mouseY){
        qdr = 3;
      }
      else if(RcenX < mouseX && RcenY < mouseY){
        qdr = 4;
      }
    }
  }
  //ピンクならば
  else if(red(c)==241 && green(c)==205 && blue(c)==219){
    //左側の渦巻きならば
    if(dist(mouseX,mouseY,LrtcenX,LrtcenY) <= Lrtdia/2){
      prm = "左比率";
      
      //何象限でドラッグを始めたか
      if(LrtcenX < mouseX && LrtcenY > mouseY){
        qdr = 1;
      }
      else if(LrtcenX > mouseX && LrtcenY > mouseY){
        qdr = 2;
      }
      else if(LrtcenX > mouseX && LrtcenY < mouseY){
        qdr = 3;
      }
      else if(LrtcenX < mouseX && LrtcenY < mouseY){
        qdr = 4;
      }
    }
    //右側の渦巻きならば
    if(dist(mouseX,mouseY,RrtcenX,RrtcenY) <= Rrtdia/2){
      prm = "右比率";
      
      //何象限でドラッグを始めたか
      if(RrtcenX < mouseX && RrtcenY > mouseY){
        qdr = 1;
      }
      else if(RrtcenX > mouseX && RrtcenY > mouseY){
        qdr = 2;
      }
      else if(RrtcenX > mouseX && RrtcenY < mouseY){
        qdr = 3;
      }
      else if(RrtcenX < mouseX && RrtcenY < mouseY){
        qdr = 4;
      }
    }
  }
  else{
    prm = "なし";
  }
}

void mouseDragged(){
  if(prm == "左直径"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(LcenX < mouseX && LcenY > mouseY){
        if(last_mouseX < mouseX){
          slider_Lrr.setValue(Lrr + mouseX*0.00003);
        }
        else if(last_mouseX > mouseX){
          slider_Lrr.setValue(Lrr - mouseX*0.00003);
        }
        if(last_mouseY > mouseY){
          slider_Lrr.setValue(Lrr + mouseY*0.00003);
        }
        else if(last_mouseY < mouseY){
          slider_Lrr.setValue(Lrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(LcenX > mouseX && LcenY > mouseY){
        if(last_mouseX > mouseX){
          slider_Lrr.setValue(Lrr + mouseX*0.00003);
        }
        else if(last_mouseX < mouseX){
          slider_Lrr.setValue(Lrr - mouseX*0.00003);
        }
        if(last_mouseY > mouseY){
          slider_Lrr.setValue(Lrr + mouseY*0.00003);
        }
        else if(last_mouseY < mouseY){
          slider_Lrr.setValue(Lrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(LcenX > mouseX && LcenY < mouseY){
        if(last_mouseX > mouseX){
          slider_Lrr.setValue(Lrr + mouseX*0.00003);
        }
        else if(last_mouseX < mouseX){
          slider_Lrr.setValue(Lrr - mouseX*0.00003);
        }
        if(last_mouseY < mouseY){
          slider_Lrr.setValue(Lrr + mouseY*0.00003);
        }
        else if(last_mouseY > mouseY){
          slider_Lrr.setValue(Lrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(LcenX < mouseX && LcenY < mouseY){
        if(last_mouseX < mouseX){
          slider_Lrr.setValue(Lrr + mouseX*0.00003);
        }
        else if(last_mouseX > mouseX){
          slider_Lrr.setValue(Lrr - mouseX*0.00003);
        }
        if(last_mouseY < mouseY){
          slider_Lrr.setValue(Lrr + mouseY*0.00003);
        }
        else if(last_mouseY > mouseY){
          slider_Lrr.setValue(Lrr - mouseY*0.00003);
        }
      //}
    }
  }
  
  if(prm == "右直径"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(RcenX < mouseX && RcenY > mouseY){
        if(last_mouseX < mouseX){
          slider_Rrr.setValue(Rrr + mouseX*0.00003);
        }
        else if(last_mouseX > mouseX){
          slider_Rrr.setValue(Rrr - mouseX*0.00003);
        }
        if(last_mouseY > mouseY){
          slider_Rrr.setValue(Rrr + mouseY*0.00003);
        }
        else if(last_mouseY < mouseY){
          slider_Rrr.setValue(Rrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(RcenX > mouseX && RcenY > mouseY){
        if(last_mouseX > mouseX){
          slider_Rrr.setValue(Rrr + mouseX*0.00003);
        }
        else if(last_mouseX < mouseX){
          slider_Rrr.setValue(Rrr - mouseX*0.00003);
        }
        if(last_mouseY > mouseY){
          slider_Rrr.setValue(Rrr + mouseY*0.00003);
        }
        else if(last_mouseY < mouseY){
          slider_Rrr.setValue(Rrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(RcenX > mouseX && RcenY < mouseY){
        if(last_mouseX > mouseX){
          slider_Rrr.setValue(Rrr + mouseX*0.00003);
        }
        else if(last_mouseX < mouseX){
          slider_Rrr.setValue(Rrr - mouseX*0.00003);
        }
        if(last_mouseY < mouseY){
          slider_Rrr.setValue(Rrr + mouseY*0.00003);
        }
        else if(last_mouseY > mouseY){
          slider_Rrr.setValue(Rrr - mouseY*0.00003);
        }
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(RcenX < mouseX && RcenY < mouseY){
        if(last_mouseX < mouseX){
          slider_Rrr.setValue(Rrr + mouseX*0.00003);
        }
        else if(last_mouseX > mouseX){
          slider_Rrr.setValue(Rrr - mouseX*0.00003);
        }
        if(last_mouseY < mouseY){
          slider_Rrr.setValue(Rrr + mouseY*0.00003);
        }
        else if(last_mouseY > mouseY){
          slider_Rrr.setValue(Rrr - mouseY*0.00003);
        }
      //}
    }
  }
  
  if(prm == "左比率"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(LrtcenX < mouseX && LrtcenY > mouseY){
        if(last_mouseX < mouseX){
          slider_Latranslate.setValue(Latranslate + mouseX*0.00001);
        }
        else if(last_mouseX > mouseX){
          slider_Latranslate.setValue(Latranslate - mouseX*0.00001);
        }
        if(last_mouseY > mouseY){
          slider_Latranslate.setValue(Latranslate + mouseY*0.00001);
        }
        else if(last_mouseY < mouseY){
          slider_Latranslate.setValue(Latranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(LrtcenX > mouseX && LrtcenY > mouseY){
        if(last_mouseX > mouseX){
          slider_Latranslate.setValue(Latranslate + mouseX*0.00001);
        }
        else if(last_mouseX < mouseX){
          slider_Latranslate.setValue(Latranslate - mouseX*0.00001);
        }
        if(last_mouseY > mouseY){
          slider_Latranslate.setValue(Latranslate + mouseY*0.00001);
        }
        else if(last_mouseY < mouseY){
          slider_Latranslate.setValue(Latranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(LrtcenX > mouseX && LrtcenY < mouseY){
        if(last_mouseX > mouseX){
          slider_Latranslate.setValue(Latranslate + mouseX*0.00001);
        }
        else if(last_mouseX < mouseX){
          slider_Latranslate.setValue(Latranslate - mouseX*0.00001);
        }
        if(last_mouseY < mouseY){
          slider_Latranslate.setValue(Latranslate + mouseY*0.00001);
        }
        else if(last_mouseY > mouseY){
          slider_Latranslate.setValue(Latranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(LrtcenX < mouseX && LrtcenY < mouseY){
        if(last_mouseX < mouseX){
          slider_Latranslate.setValue(Latranslate + mouseX*0.00001);
        }
        else if(last_mouseX > mouseX){
          slider_Latranslate.setValue(Latranslate - mouseX*0.00001);
        }
        if(last_mouseY < mouseY){
          slider_Latranslate.setValue(Latranslate + mouseY*0.00001);
        }
        else if(last_mouseY > mouseY){
          slider_Latranslate.setValue(Latranslate - mouseY*0.00001);
        }
      //}
    }
  }
  if(prm == "右比率"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(RrtcenX < mouseX && RrtcenY > mouseY){
        if(last_mouseX < mouseX){
          slider_Ratranslate.setValue(Ratranslate + mouseX*0.00001);
        }
        else if(last_mouseX > mouseX){
          slider_Ratranslate.setValue(Ratranslate - mouseX*0.00001);
        }
        if(last_mouseY > mouseY){
          slider_Ratranslate.setValue(Ratranslate + mouseY*0.00001);
        }
        else if(last_mouseY < mouseY){
          slider_Ratranslate.setValue(Ratranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(RrtcenX > mouseX && RrtcenY > mouseY){
        if(last_mouseX > mouseX){
          slider_Ratranslate.setValue(Ratranslate + mouseX*0.00001);
        }
        else if(last_mouseX < mouseX){
          slider_Ratranslate.setValue(Ratranslate - mouseX*0.00001);
        }
        if(last_mouseY > mouseY){
          slider_Ratranslate.setValue(Ratranslate + mouseY*0.00001);
        }
        else if(last_mouseY < mouseY){
          slider_Ratranslate.setValue(Ratranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(RrtcenX > mouseX && RrtcenY < mouseY){
        if(last_mouseX > mouseX){
          slider_Ratranslate.setValue(Ratranslate + mouseX*0.00001);
        }
        else if(last_mouseX < mouseX){
          slider_Ratranslate.setValue(Ratranslate - mouseX*0.00001);
        }
        if(last_mouseY < mouseY){
          slider_Ratranslate.setValue(Ratranslate + mouseY*0.00001);
        }
        else if(last_mouseY > mouseY){
          slider_Ratranslate.setValue(Ratranslate - mouseY*0.00001);
        }
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(RrtcenX < mouseX && RrtcenY < mouseY){
        if(last_mouseX < mouseX){
          slider_Ratranslate.setValue(Ratranslate + mouseX*0.00001);
        }
        else if(last_mouseX > mouseX){
          slider_Ratranslate.setValue(Ratranslate - mouseX*0.00001);
        }
        if(last_mouseY < mouseY){
          slider_Ratranslate.setValue(Ratranslate + mouseY*0.00001);
        }
        else if(last_mouseY > mouseY){
          slider_Ratranslate.setValue(Ratranslate - mouseY*0.00001);
        }
      //}
    }
  }
}

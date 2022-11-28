void draw(){
  println(prm);
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
   //UI
   if(Lcount == 0){
     LcirX0 = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     LcirY0 = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     Lcount ++;
   }
   if(i > (0.5*PI)/STEP && Lcount == 1){
     LcirX05 = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     LcirY05 = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     Lcount ++;
   }
   if(i > PI/STEP && Lcount == 2){
     LcirX1 = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     LcirY1 = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     Lcount ++;
   }
   //直径のY座標
   if(i > (2*PI)/STEP && Lcount == 3){
     LcirX2 = Lrad(Ltheta)*cos(Ltheta)+ 400 + Lx;
     LcirY2 = Lrad(Ltheta)*sin(Ltheta) + height/2 - Ly;
     Lcount ++;
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
  //中心のX,Y座標
  LspcenX = LcirX0;
  LspcenY = LcirY0;
  LcenX = sbXl;
  LcenY = LcirY2;
  LrtcenX = (sbXl+LcirX05)/2;
  LrtcenY = (LcirY05 + sbYl)/2;
  LincenX = (LcirX1+LcirX0)/2;
  LincenY = LcirY0;
  //直径
  Ldia = 2*(LcenY-sbYl);
  Lrtdia = LcirY05 - sbYl;
  Lindia = 2*(LincenX-LcirX0);
  
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
   
   if(Rcount == 0){
     RcirX0 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY0 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (0.1*PI)/STEP && Rcount == 1){
     RcirX01 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY01 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (0.5*PI)/STEP && Rcount == 2){
     RcirX05 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY05 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > PI/STEP && Rcount == 3){
     RcirX1 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY1 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (1.25*PI)/STEP && Rcount == 4){
     RcirX125 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY125 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (1.5*PI)/STEP && Rcount == 5){
     RcirX15 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY15 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (2*PI)/STEP && Rcount == 6){
     RcirX2 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY2 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
   }
   if(i > (2.5*PI)/STEP && Rcount == 7){
     RcirX25 = Rrad(Rtheta)*cos(Rtheta) + 400 + Rx;
     RcirY25 = Rrad(Rtheta)*sin(Rtheta)+height/2 - Ry;
     Rcount ++;
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
  //葉
  //Rspiral==1のとき
  RcirXrU = RcirX01;
  RcirYrU = RcirY01 - lbr;
  RcirXrB = RcirX05;
  RcirYrB = RcirY05 - lbr;
  //Rspiral==2のとき
  RcirXt = RcirX2- 0.1*lbr;
  RcirYt = RcirY2 - 2500/RmaxR - lbr;//RmaxRが大きい時は低く（谷ができるのを避ける）、小さい時は高く(茎にくっつくのを避ける)
  RcirXb = RcirX05- 0.1*lbr;
  RcirYb = RcirY05 - 2500/RmaxR - lbr;//RmaxRが大きい時は低く（谷ができるのを避ける）、小さい時は高く(茎にくっつくのを避ける)
  RcirXl = RcirX15;
  RcirYl = RcirY15;
  //UI
  //中心のX,Y座標
  RspcenX = RcirX0;
  RspcenY = RcirY0;
  RcenX = sbXr;
  RcenY = RcirY25;
  RrtcenX = (sbXr+RcirX1)/2;
  RrtcenY = (sbYr+RcirY1)/2;
  RincenX = (RcirX0+RcirX1)/2;
  RincenY = (RcirY0+RcirY1)/2;
  //直径
  Rdia = 2*(sbYr-RcenY);
  Rrtdia = sbYr-RcirY1;
  Rindia = 2*(RcirY1-RincenY);
  
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
  if(lpattern == 1 || lpattern == 3){
    stroke(70,190,70);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20, LmaxR*0.15+415, 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
  }
  if(lpattern == 2 || lpattern == 3){
    stroke(70,190,70);
    bezier(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl, 
    0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), LmaxR*0.2+415, 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl));
    //stroke(255, 100, 0);
    //line(sbXl, sbYl, greenXl+120000/pow(LmaxR,1.95)+120000/pow(RmaxR,2.15)-60, sbYl);
    //line(0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20), LmaxR*0.2+415, 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08, 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl));
  }
  
  //UI
  //葉数
  ltcenX = sbXl;
  ltcenY = sbYl;
  llcenX = 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08;
  llcenY = 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
  lrcenX = 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08;
  lrcenY = LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl;
  
  //UI
  //葉
  //左側の葉群
  if(lpattern == 1 || lpattern == 3){
    //（右側の葉）1本目の直線
    A = greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20;
    B = LmaxR*0.15+415;
    C = 0.71*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08;
    D = LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl;
    A1 = (B-D)/(A-C);
    B1 = D-((B-D)/(A-C))*C;
  }
  else if(lpattern == 2){
     //（左側の葉）1本目の直線
    A = 0.94*(greenXl+LmaxR*0.1+lbl*0.1-origin_lbl*0.1+20);
    B = LmaxR*0.2+415;
    C = 0.6*(LmaxR*lbl*0.002+LmaxR*0.55+lbl*0.9)-RmaxR*0.1+Rx*0.08;
    D = 0.98*(LmaxR*0.25+RmaxR*0.25+lbl*0.15+375+100/lbl);
    A1 = (B-D)/(A-C);
    B1 = D-((B-D)/(A-C))*C;
  }
  
  
  //2本目の直線
  for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      //左側の葉群
      E = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      F = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //右側の葉群
      Et = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      Ft = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //stroke(70,190,70);
      //ellipse(X,Y,3,3);
      if(t == 0.6){//ベジェの途中（t=0.6）から葉を描画
        //微分
        float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
        float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
        //微分値が等しくなるよう、方程式を解いてG,Hの値を定める
        //E,Fはtによって更新され続けるからt=0.6の時のE,Fの値を代入しておく
        
        //左側の葉群
        Ed = E;
        Fd = F;
        G = (dXt+3*E)/3;
        H = (dYt+3*F)/3;
        A2 = (F-H)/(E-G);
        B2 = H-((F-H)/(E-G))*G;
      }
      else if(t == 0.700000050){//ベジェの途中（t=0.700000050(0.7だとダメだったので)）から葉を描画
        //微分
        float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
        float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
        //微分値が等しくなるよう、方程式を解いてG,Hの値を定める
        //E,Fはtによって更新され続けるからt=0.6の時のE,Fの値を代入しておく
        
        //右側の葉群
        Etd = Et;
        Ftd = Ft;
        Gt = (dXt+3*Et)/3;
        Ht = (dYt+3*Ft)/3;
        At2 = (Ft-Ht)/(Et-Gt);
        Bt2 = Ht-((Ft-Ht)/(Et-Gt))*Gt;
      }
      //print(t);
  }
  
  //左側の葉群
  //直線1,2の交点
  PX = (B2-B1)/(A1-A2);
  PY = (A1*B2-A2*B1)/(A1-A2);
  //変数置き換え
  K = pow((PX-C),2)+pow((PY-D),2);
  L = K-pow(PX,2)-pow(PY,2);
  M = 1+pow(A2,2);
  O = -2*PX-2*PY*A2+2*A2*B2;
  P = pow(B2,2)-2*PY*B2-L;
  //MI^2+OI+P=0を解く
  float o = O/2;
  //茎上の点
  I = (-o + abs(sqrt(pow(o,2)-M*P)))/M;
  J = A2*I+B2;
  //直線3,4の交点
  lcenX = (A1*A2*(D-J)+A2*C-A1*I)/(A2-A1);
  lcenY = line3(lcenX);
  //葉の直径
  ldia = 2*dist(C,D,lcenX,lcenY);
  
  ////左側の葉群下書き(葉のUI)
  //noFill();
  ////ベジェ
  //strokeWeight(3);
  //stroke(255, 100, 0);
  //line(A, B, C, D);
  //line(Ed, Fd, G, H);
  ////直線
  //strokeWeight(1);
  //stroke(0,255,0);
  ////直線1：y=A1*x+B1
  //line(0,line1(0),800,line1(800));
  ////直線2：y=A2*x+B2
  //line(0,line2(0),800,line2(800));
  ////直線1,2の交点
  //noStroke();
  //fill(0,255,0);
  //ellipse(PX,PY,10,10);
  ////葉上の点
  //ellipse(C,D,10,10);
  ////茎上の点
  //ellipse(I,J,10,10);
  ////直角に交わる直線
  //noFill();
  //stroke(0,255,0);
  //strokeWeight(1);
  ////直線3
  //line(0,line3(0),800,line3(800));
  ////直線4
  //line(0,line4(0),800,line4(800));
  ////直線3,4の交点
  //noStroke();
  //fill(0,255,0);
  //ellipse(lcenX,lcenY,10,10);
  

  noFill(); 
  strokeWeight(3);
  //UI  
  if(rpattern == 0){
    for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      float Y = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      if(t == 0.3){
        //葉数
        rlcenX = X;
        rlcenY = Y;
      }
    }
  }
  if(rpattern == 1 || rpattern == 3){
    
    for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*sbXl + 3*pow(1-t,2)*t*a + 3*pow(1-t,1)*t*t*b + t*t*t*sbXr;
      float Y = pow(1-t,3)*sbYl + 3*pow(1-t,2)*t*sbYl + 3*pow(1-t,1)*t*t*sbYr + t*t*t*sbYr;
      //stroke(70,190,70);
      //ellipse(X,Y,3,3);
    
      if(t == 0.3){//ベジェの途中（t=0.3）から葉を描画
        if(Rspiral == 1){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          float g = RcirXrU - 40*Rrr + 0.15*LmaxR - 60;
          float h = ((RcirYrU-d)/(RcirXrU-c))*g+d-c*(RcirYrU-d)/(RcirXrU-c);
          float e = RcirXrU - 50*Rrr + 0.15*LmaxR - 60;
          float f = ((RcirYrU-d)/(RcirXrU-c))*e+d-c*(RcirYrU-d)/(RcirXrU-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
          //葉
          L1X=X;
          L2X=c;
          L3X=e;
          L4X=g;
          L1Y=Y;
          L2Y=d;
          L3Y=f;
          L4Y=h;
          //葉数
          rtcenX = g;
          rtcenY = h;
        }
        else if(Rspiral == 2){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          float g = RcirXl - 6*Rrr + 0.10*LmaxR - 40;
          float h = ((RcirYt-d)/(RcirXt-c))*g+d-c*(RcirYt-d)/(RcirXt-c);
          float e = RcirXl - 15*Rrr + 0.10*LmaxR - 40;
          float f = ((RcirYt-d)/(RcirXt-c))*e+d-c*(RcirYt-d)/(RcirXt-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
          if(rpattern == 1){
            //葉
            L1X=X;
            L2X=c;
            L3X=e;
            L4X=g;
            L1Y=Y;
            L2Y=d;
            L3Y=f;
            L4Y=h;
          }
          //葉数
          rtcenX = g;
          rtcenY = h;
        }
      }
    }
  }
  if(rpattern == 2 || rpattern == 3){

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
          float g = RcirXrB - 40*Rrr + 0.05*LmaxR - 50;
          float h = ((RcirYrB-d)/(RcirXrB-c))*g+d-c*(RcirYrB-d)/(RcirXrB-c);
          float e = RcirXrB - 50*Rrr + 0.05*LmaxR - 50;
          float f = ((RcirYrB-d)/(RcirXrB-c))*e+d-c*(RcirYrB-d)/(RcirXrB-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
          //葉
          L1X=X;
          L2X=c;
          L3X=e;
          L4X=g;
          L1Y=Y;
          L2Y=d;
          L3Y=f;
          L4Y=h;
          //葉数
          rbcenX = g;
          rbcenY = h;
        }
        else if(Rspiral == 2){
          //微分
          float dXt = -3*sbXl*pow(1-t,2) + 3*a*(3*t*t-4*t+1) + 3*b*t*(2-3*t) + 3*sbXr*t*t;
          float dYt = -3*sbYl*pow(1-t,2) + 3*sbYl*(3*t*t-4*t+1) + 3*sbYr*t*(2-3*t) + 3*sbYr*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          float g = RcirX125 - 8*Rrr + 0.05*LmaxR - 25;
          float h = ((RcirYb-d)/(RcirXb-c))*g+d-c*(RcirYb-d)/(RcirXb-c);
          float e = RcirX125 - 16*Rrr + 0.05*LmaxR - 25;
          float f = ((RcirYb-d)/(RcirXb-c))*e+d-c*(RcirYb-d)/(RcirXb-c);
          stroke(70,190,70);
          bezier(X,Y,c,d,e,f,g,h);
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //line(e,f,g,h);
          //葉
          L1X=X;
          L2X=c;
          L3X=e;
          L4X=g;
          L1Y=Y;
          L2Y=d;
          L3Y=f;
          L4Y=h;
          //葉数
          rbcenX = g;
          rbcenY = h;
        }
      }
    } 
  }
  for(float t=0; t<=1; t+=0.1){
      //ベジェ(茎)のtを用いたパラメータ表記
      float X = pow(1-t,3)*L1X + 3*pow(1-t,2)*t*L2X + 3*pow(1-t,1)*t*t*L3X + t*t*t*L4X;
      float Y = pow(1-t,3)*L1Y + 3*pow(1-t,2)*t*L2Y + 3*pow(1-t,1)*t*t*L3Y + t*t*t*L4Y;
      //stroke(70,190,70);
      //ellipse(X,Y,3,3);
      
      if((Rspiral==1  || Rspiral==2) && rpattern==1){
        if(t == 0.6){
            //微分
            float dXt = -3*L1X*pow(1-t,2) + 3*L2X*(3*t*t-4*t+1) + 3*L3X*t*(2-3*t) + 3*L4X*t*t;
            float dYt = -3*L1Y*pow(1-t,2) + 3*L2Y*(3*t*t-4*t+1) + 3*L3Y*t*(2-3*t) + 3*L4Y*t*t;
            //微分値が等しくなるよう、方程式を解いてc,dの値を定める
            float c = (dXt+3*X)/3;
            float d = (dYt+3*Y)/3;
            //stroke(255, 100, 0);
            //line(X,Y,c,d);
            //葉
            //右側の葉群
            At = c;
            Bt = d;
            Ct = X;
            Dt = Y;
            At1 = (Bt-Dt)/(At-Ct);
            Bt1 = Dt-((Bt-Dt)/(At-Ct))*Ct;
          }
      }
      if(Rspiral == 1 && (rpattern==2 || rpattern==3)){
        if(t == 0.5){
          //微分
          float dXt = -3*L1X*pow(1-t,2) + 3*L2X*(3*t*t-4*t+1) + 3*L3X*t*(2-3*t) + 3*L4X*t*t;
          float dYt = -3*L1Y*pow(1-t,2) + 3*L2Y*(3*t*t-4*t+1) + 3*L3Y*t*(2-3*t) + 3*L4Y*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //葉
          //右側の葉群
          At = c;
          Bt = d;
          Ct = X;
          Dt = Y;
          At1 = (Bt-Dt)/(At-Ct);
          Bt1 = Dt-((Bt-Dt)/(At-Ct))*Ct;
        }
      }
      else if(Rspiral == 2 && (rpattern==2 || rpattern==3)){
        if(t == 0.6){//ベジェの途中（t=0.3）から葉を描画
          //微分
          float dXt = -3*L1X*pow(1-t,2) + 3*L2X*(3*t*t-4*t+1) + 3*L3X*t*(2-3*t) + 3*L4X*t*t;
          float dYt = -3*L1Y*pow(1-t,2) + 3*L2Y*(3*t*t-4*t+1) + 3*L3Y*t*(2-3*t) + 3*L4Y*t*t;
          //微分値が等しくなるよう、方程式を解いてc,dの値を定める
          float c = (dXt+3*X)/3;
          float d = (dYt+3*Y)/3;
          //stroke(255, 100, 0);
          //line(X,Y,c,d);
          //葉
          //右側の葉群
          At = c;
          Bt = d;
          Ct = X;
          Dt = Y;
          At1 = (Bt-Dt)/(At-Ct);
          Bt1 = Dt-((Bt-Dt)/(At-Ct))*Ct;
        }
      }
    }
    
  //右側の葉群
  //直線1,2の交点
  PtX = (Bt2-Bt1)/(At1-At2);
  PtY = (At1*Bt2-At2*Bt1)/(At1-At2);
  //変数置き換え
  Kt = pow((PtX-Ct),2)+pow((PtY-Dt),2);
  Lt = Kt-pow(PtX,2)-pow(PtY,2);
  Mt = 1+pow(At2,2);
  Ot = -2*PtX-2*PtY*At2+2*At2*Bt2;
  Pt = pow(Bt2,2)-2*PtY*Bt2-Lt;
  //MtIt^2+OtIt+Pt=0を解く
  float ot = Ot/2;
  //茎上の点
  It = (-ot + abs(sqrt(pow(ot,2)-Mt*Pt)))/Mt;
  Jt = At2*It+Bt2;
  //直線3,4の交点
  lcentX = (At1*At2*(Dt-Jt)+At2*Ct-At1*It)/(At2-At1);
  lcentY = linet3(lcentX);
  //葉の直径
  ltdia = 2*dist(Ct,Dt,lcentX,lcentY);
  
  
  ////右側の葉群下書き(葉のUI)
  //noFill();
  ////ベジェ
  //strokeWeight(3);
  //stroke(255, 100, 0);
  //line(At, Bt, Ct, Dt);
  //line(Etd, Ftd, Gt, Ht);
  ////直線
  //strokeWeight(1);
  //stroke(0,255,0);
  ////直線1：y=A1*x+B1
  //line(0,linet1(0),800,linet1(800));
  ////直線2：y=A2*x+B2
  //line(0,linet2(0),800,linet2(800));
  ////直線1,2の交点
  //noStroke();
  //fill(0,255,0);
  //ellipse(PtX,PtY,10,10);
  ////葉上の点
  //ellipse(Ct,Dt,10,10);
  ////茎上の点
  //ellipse(It,Jt,10,10);
  ////直角に交わる直線
  //noFill();
  //stroke(0,255,0);
  //strokeWeight(1);
  ////直線3
  //line(0,linet3(0),800,linet3(800));
  ////直線4
  //line(0,linet4(0),800,linet4(800));
  ////直線3,4の交点
  //noStroke();
  //fill(0,255,0);
  //ellipse(lcentX,lcentY,10,10);
  
  //UI
  if(ui == true){//UIが表示の時
    noStroke();
    //直径
    fill(100,100,255,30);
    ellipse(LcenX,LcenY,Ldia,Ldia);
    ellipse(RcenX,RcenY,Rdia,Rdia);
    //比率
    fill(255,100,100,60);
    if(Lspiral==2){
      ellipse(LrtcenX,LrtcenY,Lrtdia,Lrtdia);
    }
    if(Rspiral==2){
      ellipse(RrtcenX,RrtcenY,Rrtdia,Rrtdia);
    }
    //内径
    fill(50,200,50,60);
    if(Lspiral==2){
      ellipse(LincenX,LincenY,Lindia,Lindia);
    }
    if(Rspiral==2){
      ellipse(RincenX,RincenY,Rindia,Rindia);
    }
    //葉
    fill(100,100,100,60);
    if(lpattern == 1 || lpattern == 3){
      ellipse(lcenX,lcenY,ldia,ldia);
    }
    else if(lpattern == 2){
      ellipse(lcenX,lcenY,ldia,ldia);
    }
    if(rpattern == 1 && Rspiral == 2){
      ellipse(lcentX,lcentY,ltdia,ltdia);
    }
    else if((rpattern == 2 || rpattern == 3) && Rspiral == 2){
      ellipse(lcentX,lcentY,ltdia,ltdia);
    }
    if(rpattern == 1 && Rspiral == 1){
      ellipse(lcentX,lcentY,ltdia,ltdia);
    }
    else if((rpattern == 2 || rpattern == 3) && Rspiral == 1){
      ellipse(lcentX,lcentY,ltdia,ltdia);
    }
    //巻き数
    fill(220,140,140);
    ellipse(LspcenX,LspcenY,15,15);
    ellipse(RspcenX,RspcenY,15,15);
    //葉数
    fill(220,140,140);
    if(lpattern == 0){
      ellipse(ltcenX,ltcenY,15,15);
    }
    else if(lpattern == 1){
      ellipse(lrcenX,lrcenY,15,15);
    }
    else if(lpattern == 2){
      ellipse(llcenX,llcenY,15,15);
    }
    else if(lpattern == 3){
      ellipse(lrcenX,lrcenY,15,15);
      ellipse(llcenX,llcenY,15,15);
    }
    if(rpattern == 0){
      ellipse(rlcenX,rlcenY,15,15);
    }
    else if(rpattern == 1){
      ellipse(rtcenX,rtcenY,15,15);
    }
    else if(rpattern == 2){
      ellipse(rbcenX,rbcenY,15,15);
    }
    else if(rpattern == 3){
      ellipse(rtcenX,rtcenY,15,15);
      ellipse(rbcenX,rbcenY,15,15);
    }

    println("r:"+red(c),"g:"+green(c)+"b:"+blue(c));
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
  lbr = slider.getController("lbr").getValue();
  
  //UI
  Lcount = 0;
  Rcount = 0;
  last_mouseX = mouseX;
  last_mouseY = mouseY;
}

void mousePressed(){
  //赤ならば
  if(red(c)==220 && green(c)==140 && blue(c)==140){
    //左側の渦巻きならば
    if(dist(mouseX,mouseY,LspcenX,LspcenY) <= 15/2){
      prm = "左巻き数";
      if(Lspiral == 1){
        slider_Lspiral.setValue(2);
      }
      else if(Lspiral == 2){
        slider_Lspiral.setValue(1);
      }
    }
    //右側の渦巻きならば
    else if(dist(mouseX,mouseY,RspcenX,RspcenY) <= 15/2){
      prm = "右巻き数";
      if(Rspiral == 1){
        slider_Rspiral.setValue(2);
      }
      else if(Rspiral == 2){
        slider_Rspiral.setValue(1);
      }
    }
    //葉数0(左)の円ならば
    else if(dist(mouseX,mouseY,ltcenX,ltcenY) <= 15/2){
      prm = "葉数0";
      if(lpattern == 0){
        slider_lpattern.setValue(3);
      }
    }
    //右側の葉（左）の円ならば
    else if(dist(mouseX,mouseY,lrcenX,lrcenY) <= 15/2){
      if(lpattern == 1){
        prm = "葉数1：右の葉";
        slider_lpattern.setValue(0);
      }
      else if(lpattern == 3){
        prm = "葉数2";
        slider_lpattern.setValue(2);
      }
    }
    //左側の葉（左）の円ならば
    else if(dist(mouseX,mouseY,llcenX,llcenY) <= 15/2){
      prm = "葉数1：左の葉";
      if(lpattern == 2){
        prm = "葉数2";
        slider_lpattern.setValue(0);
      }
      else if(lpattern == 3){
        prm = "葉数2";
        slider_lpattern.setValue(1);
      }
    }
    //葉数0(右)の円ならば
    else if(dist(mouseX,mouseY,rlcenX,rlcenY) <= 15/2){
      prm = "葉数0";
      if(rval == 0){
        slider_rval.setValue(2);
      }
    }
    //葉数1(右)の円ならば
    else if(dist(mouseX,mouseY,rtcenX,rtcenY) <= 15/2){
      prm = "葉数1";
      if(rval == 1){
        slider_rval.setValue(0);
      }
    }
    //葉数2(右)の円ならば
    else if(dist(mouseX,mouseY,rbcenX,rbcenY) <= 15/2){
      prm = "葉数2";
      if(rval == 2){
        slider_rval.setValue(1);
      }
    }
  }
  //紫ならば
  else if(red(c)==237 && green(c)==237 && blue(c)==255){
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
  //緑ならば
  else if(red(c)==193 && green(c)==228 && blue(c)==207){
    //左側の渦巻きならば
    if(dist(mouseX,mouseY,LincenX,LincenY) <= Lindia/2){
      prm = "左内径";
      
      //何象限でドラッグを始めたか
      if(LincenX < mouseX && LincenY > mouseY){
        qdr = 1;
      }
      else if(LincenX > mouseX && LincenY > mouseY){
        qdr = 2;
      }
      else if(LincenX > mouseX && LincenY < mouseY){
        qdr = 3;
      }
      else if(LincenX < mouseX && LincenY < mouseY){
        qdr = 4;
      }
    }
    else if(dist(mouseX,mouseY,RincenX,RcenY) <= Rindia/2){
      prm = "右内径";
      
      //何象限でドラッグを始めたか
      if(RincenX < mouseX && RincenY > mouseY){
        qdr = 1;
      }
      else if(RincenX > mouseX && RincenY > mouseY){
        qdr = 2;
      }
      else if(RincenX > mouseX && RincenY < mouseY){
        qdr = 3;
      }
      else if(RincenX < mouseX && RincenY < mouseY){
        qdr = 4;
      }
    }
  }
  //灰色ならば
  else if(red(c)==219 && green(c)==219 && blue(c)==219){
    //左の葉群
    //左側の葉ならば
    if(lpattern == 2 || lpattern == 3){
      prm = "左側の葉";
      //何象限でドラッグを始めたか
      if(lcenlX < mouseX && lcenlY > mouseY){
        qdr = 1;
      }
      else if(lcenlX > mouseX && lcenlY > mouseY){
        qdr = 2;
      }
      else if(lcenlX > mouseX && lcenlY < mouseY){
        qdr = 3;
      }
      else if(lcenlX < mouseX && lcenlY < mouseY){
        qdr = 4;
      }
    }
    //右側の葉ならば
    else if(lpattern == 1 || lpattern == 3){
      prm = "右側の葉";
      //何象限でドラッグを始めたか
      if(lcenX < mouseX && lcenY > mouseY){
        qdr = 1;
      }
      else if(lcenX > mouseX && lcenY > mouseY){
        qdr = 2;
      }
      else if(lcenX > mouseX && lcenY < mouseY){
        qdr = 3;
      }
      else if(lcenX < mouseX && lcenY < mouseY){
        qdr = 4;
      }
    }
  }
  else{
    prm = "なし";
  }
}

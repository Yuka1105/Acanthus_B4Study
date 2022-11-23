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
    prm = "葉";
    
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
  else{
    prm = "なし";
  }
}

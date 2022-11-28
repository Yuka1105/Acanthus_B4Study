void mouseDragged(){
  if(prm == "左直径"){
    //マウスが第一象限にある時
    if(qdr==1){
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
    }
    //マウスが第二象限にある時
    if(qdr==2){
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
    }
    //マウスが第三象限にある時
    if(qdr==3){
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
    }
    //マウスが第四象限にある時
    if(qdr==4){
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
    }
  }
  
  if(prm == "右直径"){
    if(qdr==1){
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
    }
    if(qdr==2){
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
    }
    if(qdr==3){
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
    }
    if(qdr==4){
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
    }
  }
  
  if(prm == "左比率"){
    if(qdr==1){
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
    }
    if(qdr==2){
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
    }
    if(qdr==3){
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
    }
    if(qdr==4){
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
    }
  }
  if(prm == "右比率"){
    if(qdr==1){
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
    }
    if(qdr==2){
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
    }
    if(qdr==3){
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
    }
    if(qdr==4){
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
    }
  }
  
  if(prm == "左内径"){
    if(qdr==1){
      if(last_mouseX < mouseX){
        slider_Lb.setValue(Lb + mouseX*0.0002);
      }
      else if(last_mouseX > mouseX){
        slider_Lb.setValue(Lb - mouseX*0.0002);
      }
      if(last_mouseY > mouseY){
        slider_Lb.setValue(Lb + mouseY*0.0002);
      }
      else if(last_mouseY < mouseY){
        slider_Lb.setValue(Lb - mouseY*0.0002);
      }
    }
    if(qdr==2){
      if(last_mouseX > mouseX){
        slider_Lb.setValue(Lb + mouseX*0.0002);
      }
      else if(last_mouseX < mouseX){
        slider_Lb.setValue(Lb - mouseX*0.0002);
      }
      if(last_mouseY > mouseY){
        slider_Lb.setValue(Lb + mouseY*0.0002);
      }
      else if(last_mouseY < mouseY){
        slider_Lb.setValue(Lb - mouseY*0.0002);
      }
    }
    if(qdr==3){
      if(last_mouseX > mouseX){
        slider_Lb.setValue(Lb + mouseX*0.0002);
      }
      else if(last_mouseX < mouseX){
        slider_Lb.setValue(Lb - mouseX*0.0002);
      }
      if(last_mouseY < mouseY){
        slider_Lb.setValue(Lb + mouseY*0.0002);
      }
      else if(last_mouseY > mouseY){
        slider_Lb.setValue(Lb - mouseY*0.0002);
      }
    }
    if(qdr==4){
      if(last_mouseX < mouseX){
        slider_Lb.setValue(Lb + mouseX*0.0002);
      }
      else if(last_mouseX > mouseX){
        slider_Lb.setValue(Lb - mouseX*0.0002);
      }
      if(last_mouseY < mouseY){
        slider_Lb.setValue(Lb + mouseY*0.0002);
      }
      else if(last_mouseY > mouseY){
        slider_Lb.setValue(Lb - mouseY*0.0002);
      }
    }
  }
  
  if(prm == "右内径"){
    if(qdr==1){
      if(last_mouseX < mouseX){
        slider_Rb.setValue(Rb + mouseX*0.0002);
      }
      else if(last_mouseX > mouseX){
        slider_Rb.setValue(Rb - mouseX*0.0002);
      }
      if(last_mouseY > mouseY){
        slider_Rb.setValue(Rb + mouseY*0.0002);
      }
      else if(last_mouseY < mouseY){
        slider_Rb.setValue(Rb - mouseY*0.0002);
      }
    }
    if(qdr==2){
      if(last_mouseX > mouseX){
        slider_Rb.setValue(Rb + mouseX*0.0002);
      }
      else if(last_mouseX < mouseX){
        slider_Rb.setValue(Rb - mouseX*0.0002);
      }
      if(last_mouseY > mouseY){
        slider_Rb.setValue(Rb + mouseY*0.0002);
      }
      else if(last_mouseY < mouseY){
        slider_Rb.setValue(Rb - mouseY*0.0002);
      }
    }
    if(qdr==3){
      if(last_mouseX > mouseX){
        slider_Rb.setValue(Rb + mouseX*0.0002);
      }
      else if(last_mouseX < mouseX){
        slider_Rb.setValue(Rb - mouseX*0.0002);
      }
      if(last_mouseY < mouseY){
        slider_Rb.setValue(Rb + mouseY*0.0002);
      }
      else if(last_mouseY > mouseY){
        slider_Rb.setValue(Rb - mouseY*0.0002);
      }
    }
    if(qdr==4){
      if(last_mouseX < mouseX){
        slider_Rb.setValue(Rb + mouseX*0.0002);
      }
      else if(last_mouseX > mouseX){
        slider_Rb.setValue(Rb - mouseX*0.0002);
      }
      if(last_mouseY < mouseY){
        slider_Rb.setValue(Rb + mouseY*0.0002);
      }
      else if(last_mouseY > mouseY){
        slider_Rb.setValue(Rb - mouseY*0.0002);
      }
    }
  }
  if(prm == "左側の葉群"){
    if(qdr==1){
      if(last_mouseX < mouseX){
        slider_lbl.setValue(lbl - mouseX*0.0018);
      }
      else if(last_mouseX > mouseX){
        slider_lbl.setValue(lbl + mouseX*0.0018);
      }
      if(last_mouseY > mouseY){
        slider_lbl.setValue(lbl - mouseY*0.0018);
      }
      else if(last_mouseY < mouseY){
        slider_lbl.setValue(lbl + mouseY*0.0018);
      }
    }
    if(qdr==2){
      if(last_mouseX > mouseX){
        slider_lbl.setValue(lbl - mouseX*0.0018);
      }
      else if(last_mouseX < mouseX){
        slider_lbl.setValue(lbl + mouseX*0.0018);
      }
      if(last_mouseY > mouseY){
        slider_lbl.setValue(lbl - mouseY*0.0018);
      }
      else if(last_mouseY < mouseY){
        slider_lbl.setValue(lbl + mouseY*0.0018);
      }
    }
    if(qdr==3){
      if(last_mouseX > mouseX){
        slider_lbl.setValue(lbl - mouseX*0.0018);
      }
      else if(last_mouseX < mouseX){
        slider_lbl.setValue(lbl + mouseX*0.0018);
      }
      if(last_mouseY < mouseY){
        slider_lbl.setValue(lbl - mouseY*0.0018);
      }
      else if(last_mouseY > mouseY){
        slider_lbl.setValue(lbl + mouseY*0.0018);
      }
    }
    if(qdr==4){
      if(last_mouseX < mouseX){
        slider_lbl.setValue(lbl - mouseX*0.0018);
      }
      else if(last_mouseX > mouseX){
        slider_lbl.setValue(lbl + mouseX*0.0018);
      }
      if(last_mouseY < mouseY){
        slider_lbl.setValue(lbl - mouseY*0.0018);
      }
      else if(last_mouseY > mouseY){
        slider_lbl.setValue(lbl + mouseY*0.0018);
      }
    }
  }
  if(prm == "右側の葉群"){
    if(qdr==1){
      if(last_mouseX < mouseX){
        slider_lbr.setValue(lbr + mouseX*0.0035);
      }
      else if(last_mouseX > mouseX){
        slider_lbr.setValue(lbr - mouseX*0.0035);
      }
      if(last_mouseY > mouseY){
        slider_lbr.setValue(lbr + mouseY*0.0035);
      }
      else if(last_mouseY < mouseY){
        slider_lbr.setValue(lbr - mouseY*0.0035);
      }
    }
    if(qdr==2){
      if(last_mouseX > mouseX){
        slider_lbr.setValue(lbr + mouseX*0.0035);
      }
      else if(last_mouseX < mouseX){
        slider_lbr.setValue(lbr - mouseX*0.0035);
      }
      if(last_mouseY > mouseY){
        slider_lbr.setValue(lbr + mouseY*0.0035);
      }
      else if(last_mouseY < mouseY){
        slider_lbr.setValue(lbr - mouseY*0.0035);
      }
    }
    if(qdr==3){
      if(last_mouseX > mouseX){
        slider_lbr.setValue(lbr + mouseX*0.0035);
      }
      else if(last_mouseX < mouseX){
        slider_lbr.setValue(lbr - mouseX*0.0035);
      }
      if(last_mouseY < mouseY){
        slider_lbr.setValue(lbr + mouseY*0.0035);
      }
      else if(last_mouseY > mouseY){
        slider_lbr.setValue(lbr - mouseY*0.0035);
      }
    }
    if(qdr==4){
      if(last_mouseX < mouseX){
        slider_lbr.setValue(lbr + mouseX*0.0035);
      }
      else if(last_mouseX > mouseX){
        slider_lbr.setValue(lbr - mouseX*0.0035);
      }
      if(last_mouseY < mouseY){
        slider_lbr.setValue(lbr + mouseY*0.0035);
      }
      else if(last_mouseY > mouseY){
        slider_lbr.setValue(lbr - mouseY*0.0035);
      }
    }
  }
}

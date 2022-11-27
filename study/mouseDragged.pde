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
  
  if(prm == "左内径"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(LincenX < mouseX && LincenY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(LincenX > mouseX && LincenY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(LincenX > mouseX && LincenY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(LincenX < mouseX && LincenY < mouseY){
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
      //}
    }
  }
  
  if(prm == "右内径"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(RincenX < mouseX && RincenY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(RincenX > mouseX && RincenY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(RincenX > mouseX && RincenY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(RincenX < mouseX && RincenY < mouseY){
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
      //}
    }
  }
  if(prm == "左側の葉"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(lcenlX < mouseX && lcenlY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(lcenlX > mouseX && lcenlY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(lcenlX > mouseX && lcenlY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(lcenlX < mouseX && lcenlY < mouseY){
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
      //}
    }
  }
  if(prm == "右側の葉"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(lcenX < mouseX && lcenY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(lcenX > mouseX && lcenY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(lcenX > mouseX && lcenY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(lcenX < mouseX && lcenY < mouseY){
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
      //}
    }
  }
  if(prm == "巻数2の上側の葉" || prm == "巻数1の上側の葉"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(lcentX < mouseX && lcentY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(lcentX > mouseX && lcentY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(lcentX > mouseX && lcentY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(lcentX < mouseX && lcentY < mouseY){
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
      //}
    }
  }
  if(prm == "巻数2の下側の葉" || prm == "巻数1の下側の葉"){
    //マウスが第一象限にある時
    if(qdr==1){
      //if(lcenbX < mouseX && lcenbY > mouseY){
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
      //}
    }
    //マウスが第二象限にある時
    if(qdr==2){
      //if(lcenbX > mouseX && lcenbY > mouseY){
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
      //}
    }
    //マウスが第三象限にある時
    if(qdr==3){
      //if(lcenbX > mouseX && lcenbY < mouseY){
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
      //}
    }
    //マウスが第四象限にある時
    if(qdr==4){
      //if(lcenbX < mouseX && lcenbY < mouseY){
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
      //}
    }
  }
}

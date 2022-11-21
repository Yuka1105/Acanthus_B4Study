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

//左側の動径を定める関数
float Lrad(float t){
  float r =Lrr* Lr * (pow(La, t) + Lb);//対数らせん
  return(r);
}
float Lradnext(float t){
  float Lanext = La + Latranslate * 0.001;
  float r =Lrr* Lr * (pow(Lanext, t) + Lb);//対数らせん
  return(r);
}

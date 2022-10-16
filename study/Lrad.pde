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

//右側の動径を定める関数
float Rrad(float t){
  float r =Rrr* Rr * (pow(Ra, t) + Rb);//対数らせん
  return(r);
}
float Rradnext(float t){
  float Ranext = Ra + Ratranslate * 0.001;
  float r =Rrr* Rr * (pow(Ranext, t) + Rb);//対数らせん
  return(r);
}

//UI
//葉
//直線1
float line1(float x){
    float r = A1*x+B1;
    return (r);
  }
//直線2
float line2(float x){
    float r = A2*x+B2;
    return (r);
  }
//直線3：直線1と直角に交わる直線
float line3(float x){
    float r = -(1/A1)*x+D+(1/A1)*C;
    return (r);
  }
//直線4：直線2と直角に交わる直線
float line4(float x){
    float r = -(1/A2)*x+J+(1/A2)*I;
    return (r);
  }

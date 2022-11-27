//UI
//右側の葉
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

//左側の葉
//直線1
float linel1(float x){
    float r = Al1*x+Bl1;
    return (r);
  }
//直線2
float linel2(float x){
    float r = Al2*x+Bl2;
    return (r);
  }
//直線3：直線1と直角に交わる直線
float linel3(float x){
    float r = -(1/Al1)*x+Dl+(1/Al1)*Cl;
    return (r);
  }
//直線4：直線2と直角に交わる直線
float linel4(float x){
    float r = -(1/Al2)*x+Jl+(1/Al2)*Il;
    return (r);
  }

//上側の葉
//直線1
float linet1(float x){
    float r = At1*x+Bt1;
    return (r);
  }
//直線2
float linet2(float x){
    float r = At2*x+Bt2;
    return (r);
  }
//直線3：直線1と直角に交わる直線
float linet3(float x){
    float r = -(1/At1)*x+Dt+(1/At1)*Ct;
    return (r);
  }
//直線4：直線2と直角に交わる直線
float linet4(float x){
    float r = -(1/At2)*x+Jt+(1/At2)*It;
    return (r);
  }

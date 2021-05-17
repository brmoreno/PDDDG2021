class Nodo{
  float x;
  float y;
  float ax;
  float ay;
  float r;
  float i;
  Fourrier fx;
  Fourrier fy;
  float c;
  float d;
  
  Nodo( float x_, float y_, float r_, float i_){
    ax = x_;
    ay = y_;
    r = r_;
    i = i_;
    fx = new Fourrier(10);
    fy = new Fourrier (10);
    d = random(0.01);
  }
  
  void display(){
    noFill();
    //stroke(255,0,0);
    //ellipse(x,y,r*2,r*2);
    c += d;
    x = ax+ fx.valor(c)*30;
    y = ay + fy.valor(c)*30;
  }
  
}

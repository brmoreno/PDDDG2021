class Epi{
  PVector ancla;
  float r;
  float d;
  PVector pos;
  
  Epi(PVector ancla_, float r_, float d_, float f_){
   ancla = ancla_;
   r = r_;
   d = d_;
   pos = PVector.fromAngle(f_);
   pos.setMag(r_);
  }
  
  void display(){
  pushMatrix();
  translate(ancla.x,ancla.y);
  line(0,0,pos.x,pos.y);
  noFill();
  ellipse(0,0,r*2,r*2);
  popMatrix();
  }
  
  void mover(){
    pos.rotate(d);
  }
}

Epi una;
void setup(){
  size(400,400);
  una = new Epi(new PVector(200,200),100,0.01,HALF_PI);
}

void draw(){
  background(255);
  una.display();
  una.mover();  
}

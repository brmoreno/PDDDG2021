class Epi{
  PVector ancla;
  float r;
  float d;
  PVector pos;
  Epi an;
  
  Epi(PVector ancla_, float r_, float d_, float f_){
   ancla = ancla_;
   r = r_;
   d = d_;
   pos = PVector.fromAngle(f_);
   pos.setMag(r_);
  }
  
  Epi(Epi an_, float r_, float d_, float f_){
    an = an_;
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
    if (an != null){
      ancla = an.ancla.copy().add(an.pos);
     
    }
    pos.rotate(d);
  }
}

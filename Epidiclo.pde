class Epi{
  PVector ancla;
  float r;
  float d;
  PVector pos;
  Epi an;
  color c;
  
  Epi(PVector ancla_, float r_, float d_, float f_){
   ancla = ancla_;
   r = r_;
   d = d_;
   pos = PVector.fromAngle(f_);
   pos.setMag(r_);
   c = color(random(255),random(255),random(255));
  }
  
  Epi(Epi an_, float r_, float d_, float f_){
    an = an_;
    r = r_;
    d = d_;
    pos = PVector.fromAngle(f_);
    pos.setMag(r_);
    c = color(random(255),random(255),random(255));
  }
  
  void display(){
  pushMatrix();
  translate(ancla.x,ancla.y);
  strokeWeight(5);
  stroke(0);
  line(0,0,pos.x,pos.y);
  noFill();
  //ellipse(0,0,r*2,r*2);
  popMatrix();
  }
  
  void mover(){
    if (an != null){
      ancla = an.ancla.copy().add(an.pos);  
    }
    pos.rotate(d);
  }
}

ArrayList <Epi> losEpis;

void setup(){
  size(400,400);
  losEpis= new ArrayList<Epi>();
  losEpis.add(new Epi(new PVector(200,200),50,0.01,0));
  for(int i = 1; i<10; i++){
    losEpis.add(new Epi(losEpis.get(i-1),random(10,50),random(-0.1,0.1),0));
  }
  background(255);
}

void draw(){
  background(255);

  
  //losEpis.get(0).ancla.add(0.3,0);
  for (Epi e:losEpis){
    e.mover();
    e.display();
  }
  
  
}

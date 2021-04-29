class Nodo{
  float x,y;
  float r;
  PVector vec;
  float dx, dy;
   
  Nodo(float x_, float y_, float r_, float amp_){
    x = x_;
    y = y_;
    r = r_;
    vec = PVector.random2D().mult(random(0,0.5));
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
    
    if(x<0){
      x = width;
      
    }
    if(x>width){
      x = 0;  
    }
    
    if(y<0){
      y = height;
      
    }
    if(y>height){
      y = 0;  
    }
  }
  
  void display(){
    noFill();
    stroke(255,0,0);
    ellipse(x,y,1,1);
    ellipse(x,y,r*2,r*2);
    
  }
}

class Cubo{
  float x,y;
  PVector v;
  
  Cubo(float x_, float y_){
    x = x_;
    y = y_;
    v = new PVector(1,0);
  }
  
  void display(){
    noStroke();
    fill(0,0,255);
    ellipse(x,y,2,2);
  }
}

ArrayList <Nodo> nodos;
ArrayList <Cubo> cubos;
int tam = 5;
void setup(){

  background(0);
  size(400,400);
  nodos = new ArrayList<Nodo>(); 
  cubos = new ArrayList <Cubo>();
  for(int i = 0 ; i<50; i++){
    nodos.add(new Nodo(random(0,width),random(0, height),random(30,150),random(40)));
  }
  for(int i = 0; i<width; i+= tam){
    for(int j = 0 ; j<height;j+= tam){
      cubos.add(new Cubo(i,j));
    }
  }
  
 
}

void draw(){
  background(255);
  for(Cubo c:cubos){
    c.display();
  }
  for(Nodo n:nodos){
    //n.display();
    n.mover();
  }

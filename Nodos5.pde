class Nodo{
  float x,y;
  float r;
  float amp;
  float dx, dy;
   
  Nodo(float x_, float y_, float r_, float amp_){
    x = x_;
    y = y_;
    r = r_;
    amp = amp_;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  void mover(){
    x+=dx;
    y += dy;
  }
}

class Cubo{
  float x,y,z;
  
  Cubo(float x_, float y_){
    x = x_;
    y = y_;
    z = 0;
  }
  
  void display(){
    pushMatrix();
    translate(x,y,z);
    noStroke();
    fill(255,0,0);
    box(tam);
    popMatrix();
  }
}

ArrayList <Nodo> nodos;
ArrayList <Cubo> cubos;
int tam = 10;;
void setup(){
  size(500,500,P3D);
  background(0);
  nodos = new ArrayList<Nodo>(); 
  cubos = new ArrayList <Cubo>();
  for(int i = 0 ; i<100; i++){
    nodos.add(new Nodo(random(-width/2,width/2),random(-height/2, height/2),random(30,150),random(40)));
  }
  for(int i = -width/2; i<width/2; i+= tam){
    for(int j = -height/2 ; j<height/2;j+= tam){
      cubos.add(new Cubo(i,j));
    }
  }
  
 
}

void draw(){
  background(0);
  lights();
  translate(width/2,height/2);
  rotateX(mouseX*0.03);
  rotateY(mouseY*0.03);
  for(Cubo c:cubos){
    c.display();
  }
  for(Nodo n:nodos){
    n.mover();
  }
  
  for (Cubo c:cubos){
    c.z = 0;
    for(Nodo n:nodos){
      float distancia = dist(c.x,c.y,n.x,n.y);
      if(distancia < n.r){
        c.z+=n.amp*map(distancia,0,n.r,1,0);
      }
    }
  }
}

class Nodo{
  float x,y;
  float r;
  float dx,dy;

  
  
  Nodo(float x_, float y_, float r_){
    x = x_;
    y = y_;
    r = r_;
   
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  boolean distancia(Nodo n){
    boolean res = false;
    float dista = dist(this.x,this.y,n.x,n.y);
    if(dista<this.r+n.r){
      res = true;
    }
    return(res);
  }
  
}

ArrayList <Nodo> nodos;

void setup(){
  size(400,400);
  background(255);
  nodos = new ArrayList<Nodo>();
  
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo(random(width),random(height),random(30,50)));
  }
  
}

void draw(){
  background(255);
  for(int i = 0; i <nodos.size(); i++){
    nodos.get(i).mover();
    for(int j = i; j<nodos.size(); j++){
      Nodo uno = nodos.get(i);
      Nodo dos = nodos.get(j);
      if(uno.distancia(dos)){
        line(uno.x,uno.y,dos.x,dos.y);
      }
    }
  }
}

class Nodo{
  float x,y;
  float r;
  float amp;
  float dx,dy;
  PVector vec;
  
  
  Nodo(float x_, float y_, float r_, float amp_){
    x = x_;
    y = y_;
    r = r_;
    amp = amp_;
    dx = random(-2,2);
    dy = random(-2,2);
    vec = PVector.random2D().mult(random(5,30));
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  
}


PImage gato;
PImage pg;
ArrayList <Nodo> nodos;
 
void setup(){
  size(500,500);
  gato = loadImage("gatocubrebocas.png");
  pg = createImage(gato.width,gato.height,RGB);
  gato.loadPixels();
  nodos = new ArrayList <Nodo>();
  for(int i = 0 ; i<200; i++){
    nodos.add(new Nodo(random(width),random(height),random(30,100),random(0.2)));
  }
  pg.loadPixels();
  
  for(int i = 0; i < gato.pixels.length; i++){
    int x = i % gato.width;
    int y = i/gato.width;
    PVector total = new PVector(0,0);
    for(Nodo n:nodos){
      float dist = dist(x,y,n.x,n.y);
      if(dist<n.r){
        PVector res = n.vec.copy().mult(map(dist,0,n.r,1,0));
        total.add(res);
      }
    }
    pg.pixels[i] = gato.get(x+round(total.x),y+round(total.y));  
  }
  
  
  
  pg.updatePixels();
  
  image(pg,0,0);
}

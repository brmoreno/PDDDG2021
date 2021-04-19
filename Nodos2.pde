class Nodo{
  float x,y;
  float r;
  float amp;
  float dx,dy;
  
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
    y+=dy;
  }
  void display(){
    noFill();
    noStroke();
    fill(map(amp,0,1,255,0));
    for(float i = 0; i<amp; i+=0.1){
      fill(map(i,0,1,255,0));
      ellipse(x,y,(r*2)-(r*2*i),(r*2)-(r*2*i));
    }
    //ellipse(x,y,2,2);
    //ellipse(x,y,r*2,r*2);
  } 
}

ArrayList <Nodo> nodos;
void setup(){
  size(500,500);
  background(255);
  nodos = new ArrayList<Nodo>();
  for(int i = 0 ; i<100; i++){
    nodos.add(new Nodo(random(width),random(height),random(30,150),random(0.5)));
  }
  loadPixels();
  for(int i = 0; i <pixels.length; i++){
    int x  = i%width;
    int y = i/width;
    float c = 0;
    for(Nodo n:nodos){
      float distancia = dist(n.x,n.y,x,y);
      if(distancia<n.r){
        c += n.amp*map(distancia,0,n.r,1,0);
      }
    }
    pixels[i] = color(map(c,0,1,255,0));
  }
  updatePixels();
  
}

void draw(){
  loadPixels();
  for(int i = 0; i <pixels.length; i++){
    int x  = i%width;
    int y = i/width;
    float c = 0;
    for(Nodo n:nodos){
      float distancia = dist(n.x,n.y,x,y);
      if(distancia<n.r){
        c += n.amp*map(distancia,0,n.r,1,0);
      }
    }
    pixels[i] = color(map(c,0,1,255,0));
    
  }
  updatePixels();
  for(Nodo n:nodos){
      n.mover();
    }
}

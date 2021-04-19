class Nodo{
  float x,y;
  float r;
  float amp;
  
  Nodo(float x_, float y_, float r_, float amp_){
    x = x_;
    y = y_;
    r = r_;
    amp = amp_;
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

Nodo uno;
Nodo dos;
void setup(){
  size(500,500);
  background(255);
  uno = new Nodo(width/2,height/2,100, 0.8);
  dos = new Nodo(200,200,50, 0.8);
  loadPixels();
  for(int i = 0; i <pixels.length; i++){
    int x  = i%width;
    int y = i/width;
    float c = 0;
    if(dist(uno.x,uno.y,x,y)<uno.r){
      
      c += uno.amp*map(dist(uno.x,uno.y,x,y),0,uno.r,1,0);
    }
    if(dist(dos.x,dos.y,x,y)<dos.r){
      c += dos.amp*map(dist(dos.x,dos.y,x,y),0,dos.r,1,0);
    }
    pixels[i] = color(map(c,0,1,255,0));
  }
  updatePixels();
}

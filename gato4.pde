class Nodo{
  float x,y;
  float r;
  float amp;
  float dx,dy;
  float ro,ve,az;
  
  Nodo(float x_, float y_, float r_, float amp_){
    x = x_;
    y = y_;
    r = r_;
    amp = amp_;
    dx = random(-2,2);
    dy = random(-2,2);
    ro = random(-255,255);
    ve = random(-255,255);
    az = random(-255,255);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  void display(){
    int centroH = floor(x);
    int centroV = floor(y);
    int radio = floor(r);
    int limiteizq = (centroH - radio >0)? centroH - radio:0  ;
    int limiteder = (centroH + radio<width)? centroH + radio : width;
    int limitesup = (centroV - radio> 0)? centroV - radio: 0;
    int limiteinf = (centroV + radio<height)? centroV + radio: height;
    
    for(int i = limiteizq; i< limiteder ; i++){
      for (int j = limitesup ; j< limiteinf; j++){
        float distancia = dist(x,y,i,j);
        if(distancia<r){
          int pix = j*width + i;
          color original = pixels[pix];
          float orojo = red(original);
          float overde = green(original);
          float oazul = blue(original);
          float cantidad = amp*map(distancia,0,r,1,0);
          orojo += cantidad*ro;
          overde += cantidad*ve;
          oazul += cantidad*az;
          color nuevo = color(orojo,overde,oazul);
          pixels[pix] = nuevo;
        }
      }
    }
  } 
}


PImage gato;
ArrayList <Nodo> nodos;
 
void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  gato.loadPixels();
  nodos = new ArrayList <Nodo>();
  for(int i = 0 ; i<500; i++){
    nodos.add(new Nodo(random(width),random(height),random(30,100),random(0.2)));
  }

  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    color ci = gato.pixels[i];
    pixels[i] = ci;
  }
  for(Nodo n:nodos){
      n.display();
  }
  updatePixels();
}

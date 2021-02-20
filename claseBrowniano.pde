class Browniana{
  PVector dir;
  PVector pos;
  ArrayList <PVector> posiciones;
  float ancho;
  float alto;
  PVector cg;
  PVector cv;
  PVector supizq;
  float dr;
   
  Browniana(int n){
    dr = random(-0.1,0.1);
    dir = PVector.random2D();
    posiciones = new ArrayList <PVector>();
    float minX=0,minY=0,maxX=0,maxY=0,sumX=0,sumY=0;
    for (int i = 0; i<n; i++){
      if (pos == null){
        pos = new PVector(0,0);
      }
      else{
        this.mover();
      }
      posiciones.add(pos.copy());
      minX = (pos.x < minX)? pos.x:minX; 
      minY = (pos.y < minY)? pos.y:minY;
      maxX = (pos.x > maxX)? pos.x:maxX;
      maxY = (pos.y > maxY)? pos.y:maxY;
      sumX+= pos.x;
      sumY+= pos.y;
    }
    ancho = maxX-minX;
    alto = maxY-minY;
    cg = new PVector(minX+ancho/2f, minY+alto/2f);
    cv = new PVector(sumX/n,sumY/n);
    supizq = new PVector(minX,minY);
  }
  
  void mover(){
    pos.add(dir);
    //browniano básico
    dir = PVector.random2D();
    
    //cambio de dir el 10% de las veces
    //if (random(1)<0.1){
    //  dir = PVector.random2D();
    //}
    
    //rotación aleatoria
    //dir.rotate(random(-1,1));
    
    //taza de cambio de rotación aleatoria
    //dr+= random(-0.1,0.1);
    //dir.rotate(dr);

  }
  
  PVector[] getPosiciones(){
    PVector posi[] = new PVector[posiciones.size()];
    for(int i=0; i<posiciones.size(); i++){
      posi[i] = posiciones.get(i);
    }
    return posi;
  }
}

Browniana una;
PVector pos[];

void setup(){
  size(400,400);
  una = new Browniana(500);
  pos = una.getPosiciones();
  //escalo los vectores y los centro
  float fx = width/una.ancho;
  float fy = height/una.alto;
  for(int i = 0; i<pos.length;i++){
    pos[i].sub(una.cg);
    pos[i].x*=fx;
    pos[i].y*=fy;
  }
  background(255);
  translate(width/2,height/2);
    for(int i = 0; i<pos.length-1; i++){
       line(pos[i].x,pos[i].y,pos[i+1].x,pos[i+1].y);
    }
}

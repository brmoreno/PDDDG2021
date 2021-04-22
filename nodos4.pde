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
}

ArrayList <Nodo> nodos;
int tam = 10;;
void setup(){
  size(500,500,P3D);
  background(0);
  nodos = new ArrayList<Nodo>();
  nodos.add(new Nodo(width/2, height/2,100,200));
  //for(int i = 0 ; i<100; i++){
    //nodos.add(new Nodo(random(width),random(height),random(30,150),random(0.5)));
  //}
}

void draw(){
  translate(-width/2,-height/2);
  background(0);
  lights();
  
  rotateY(mouseX*0.03);
  translate(width/2,height/2);
  for(int i = 0; i<width; i+= tam){
    for(int j = 0 ; j<height;j+= tam){
      noStroke();
      fill(255,0,0);
      pushMatrix();
      float distancia = dist(nodos.get(0).x,nodos.get(0).y,i,j);
      float z = 0;
      if(distancia<nodos.get(0).r){
        z+= nodos.get(0).amp*map(distancia,0,nodos.get(0).r,1,0);
      }
      translate(i,j,z);
      box(tam);
      popMatrix();
    }
  }
}

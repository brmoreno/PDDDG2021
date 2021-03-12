class Fourrier{
  int n;
  float amp[];
  float freq[];
  float fase[];
  
  Fourrier(int n_){
    n = n_;
    amp = new float[n_];
    freq = new float[n_];
    fase = new float [n_];
    for(int i = 0; i<n_; i++){
      fase[i] = random(TWO_PI);
      freq[i] = random(0.2,3);
      amp[i] = random(0.2,3); 
    }
  }
  
   float valor(float v_){
     float val = 0;
     for(int i = 0 ;i<n;i++){
       val += sin(v_*freq[i]+fase[i])*amp[i]; 
     }
       
     return val;
   }
   
   float valorEnN(float v_, int n_){
     float val = 0;
     for(int i = 0 ;i<n_;i++){
       val += sin(v_*freq[i]+fase[i])*amp[i]; 
     }
       
     return val;
   }
}

Fourrier r;
Fourrier g;
Fourrier b;
Fourrier t;
float escala = 0.01;
void setup(){
  size(800,400);
  r = new Fourrier(10);
  g = new Fourrier(10);
  b = new Fourrier(10);
  t = new Fourrier(10);
  background(255);
  for(float i = 0; i<width; i+= 0.5){
    float rojo = map(r.valor(i*escala),-10,10,200,255);
    float verde = map(g.valor(i*escala),-10,10,0,100);
    float azul = map(b.valor(i*escala),-10,10,0,255);
    float tam = map(t.valor(i*escala),-10,10,0,50);
    color c = color(rojo,verde,azul);
    stroke(c);
    noStroke();
    fill(c);
    ellipse(i,height/2,tam,tam);
  }
}

class Fourrier{
  int x;
  int y;
  int n;
  float amp[];
  float freq[];
  float fase[];
  
  Fourrier(int n_, int x_, int y_){
    x = x_;
    y = y_;
    n = n_;
    amp = new float[n_];
    freq = new float[n_];
    fase = new float [n_];
    for(int i = 0; i<n_; i++){
      fase[i] = random(TWO_PI);
      freq[i] = random(-0.1, 0.1);
      amp[i] = random(1,10); 
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

ArrayList <Fourrier> f;
ArrayList <Fourrier> g;
float d;
PGraphics pg;

void setup(){
  size(500,500);
  f = new ArrayList<Fourrier>();
  g = new ArrayList<Fourrier>();

 
    
  
  background(255);
  pg = createGraphics(500,500);
  pg.beginDraw();
  pg.textSize(500);
  pg.fill(0);
  pg.text("F",0,480);
  
  pg.endDraw();
  
  //image(pg,0,0);
  
  pg.loadPixels();
  for(int i = 0; i<pg.pixels.length; i++){
    int col = pg.pixels[i];
    if(alpha(col) != 0 && random(1)>0.995){
      f.add(new Fourrier(10,i%pg.width,i/pg.width));
      g.add(new Fourrier(10,i%pg.width,i/pg.width));
    }
  }
}

void draw(){
  d+=0.5;
  for(int i = 0; i<f.size();i++){
    float x = f.get(i).valor(d);
    float y = g.get(i).valor(d); 
    noStroke();
    fill(0);
    ellipse(f.get(i).x+x,g.get(i).y+y,0.5,0.5);
  }
}

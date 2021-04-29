class OsciladorIr{
  float inicio[];
  float tam[];
  float amp[];
  float min;
  float max;
  int n;
  //
  OsciladorIr(int n_){
    n = n_;
    inicio = new float[n];
    tam = new float [n];
    amp = new float [n];
    for(int i = 0 ; i<n; i++){
      inicio[i] = random(TWO_PI);
      amp[i] = random(-2,2);
      tam[i] = random(TWO_PI/20,TWO_PI);
    }
    
    min = 0;
    max = 0;
    for (int i = 0 ; i<n; i++){
      float valorCentro = inicio[i] + tam[i]/2;
      float val = valor(valorCentro);
      if (min < val){
        min = val;
      }
      
      if(max>val){
        max = val;
      }
    }
  }
  
  float valor(float v_){
    float v = v_%TWO_PI;
    float valor = 0;
    for (int i = 0 ; i< n ; i++){
      float puntoInicio = inicio[i];
      float puntoFinal = inicio[i] + tam[i];
      if(v>puntoInicio && v<puntoFinal){
        valor += sin(map(v,puntoInicio,puntoFinal, 0,PI))*amp[i]; 
      }
      if(puntoFinal>TWO_PI&& v<puntoFinal%TWO_PI){
        valor += sin(map(v,puntoInicio-TWO_PI,puntoFinal%TWO_PI, 0,PI))*amp[i];
      }
    }
    
    return valor;
  } 
}

OsciladorIr rx;
OsciladorIr gx;
OsciladorIr bx;



PImage gato;

void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  gato.loadPixels();
  rx = new OsciladorIr(15);
  gx = new OsciladorIr(15);
  bx = new OsciladorIr(15);

  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    color ci = gato.pixels[i];
    float rojo = red(ci);
    float verde = green(ci);
    float azul = blue(ci);
    
    float ri = map(rx.valor(map(rojo,0,255,0,TWO_PI)),rx.min,rx.max,-30,30);
    float vi = map(gx.valor(map(verde,0,255,0,TWO_PI)),gx.min,gx.max,-30,30);
    float az = map(bx.valor(map(azul,0,255,0,TWO_PI)),bx.min,bx.max,-30,30);;
  
    rojo += ri;
    verde += vi;
    azul += az;

    pixels[i] = color(rojo,verde,azul);
  }
  updatePixels();
}

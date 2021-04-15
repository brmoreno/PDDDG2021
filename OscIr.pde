//resuelto para que funcione en el periodo.
//aún tiene un detalle: no funciona para valor(v_) donde v_ es negativo
// ¿Pueden resolver el problema?

class OsciladorIr{
  float inicio[];
  float tam[];
  float amp[];
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

OsciladorIr uno;
OsciladorIr dos;
OsciladorIr tres;
void setup(){
  size(800,400);
  background(255);
  fill(0);
  uno = new OsciladorIr(10);
  dos = new OsciladorIr(10);
  tres = new OsciladorIr(10);
  for(int i = 0; i<width; i++){
    float y  = uno.valor(map(i,0,width,0,TWO_PI));
    float yb  = dos.valor(map(i,0,width,0,TWO_PI));
    float yg  = tres.valor(map(i,0,width,0,TWO_PI));
    //ellipse(i,y,2,2);
    noStroke();
    fill(map(y,-2,2,0,255),map(yg,-2,2,0,255),map(yb,-2,2,0,255));
    rect(i,0,1,400);
  }
}

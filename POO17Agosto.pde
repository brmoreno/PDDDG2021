//vg;
float x,y,w,h;
float dx;

//setup : establecer condiciones de inicio, se corre una sola vez
void setup(){
  size(400,400);
  x = 200;
  y = 200;
  w = 200;
  h = 200;
  dx = 1;
  background(255);
}

//draw : se va a ejecutar constantemente, cada 20ms;
void draw(){
  background(255);
  x+=dx;
  fill(255,0,0);
  ellipse(x,y,w,h);
  if(x>400-w/2){
    dx *= -1;
  }
}

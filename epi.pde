PVector pos;
float t;
float d = 0.005;

void setup(){
  size(400,400);
  t = 100;
  pos = new PVector(t, 0);
  
}

void draw(){
  pos.rotate(d);
  background(255);
  translate(200,200);
  ellipse(0,0,t*2,t*2);
  line(-t,0,t,0);
  line(-t,0,pos.x,pos.y);
  line(t,0,pos.x,pos.y);
  ellipse(pos.x,pos.y,10,10);
}

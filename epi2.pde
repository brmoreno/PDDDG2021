PVector pos;
float t;
float d = 0.005;
PVector epi;
float t2;
float d2 = 0.05;
PGraphics foo;

void setup(){
  size(400,400);
  t = 100;
  t2 = 40;
  pos = new PVector(t, 0);
  epi = new PVector(t2, 0);
  foo = createGraphics(400,400);
}

void draw(){
  noFill();
  pos.rotate(d);
  epi.rotate(d2);
  background(255);
  foo.beginDraw();
  foo.translate(200,200);
  foo.noStroke();
  foo.fill(255,0,0);
  foo.ellipse(pos.x+epi.x,pos.y+epi.y,10,10);
  foo.endDraw();
  image(foo,0,0);
  translate(200,200);
  ellipse(0,0,t*2,t*2);
  line(-t,0,t,0);
  line(-t,0,pos.x,pos.y);
  line(t,0,pos.x,pos.y);
 
  
  ellipse(pos.x,pos.y,t2*2,t2*2);
  line(pos.x-t2,pos.y,pos.x+t2,pos.y);
  line(pos.x-t2,pos.y,pos.x+epi.x,pos.y+epi.y);
  line(pos.x+t2,pos.y,pos.x+epi.x,pos.y+epi.y);
  fill(0);
  ellipse(pos.x+epi.x,pos.y+epi.y,10,10);  
}

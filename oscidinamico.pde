PVector pos ;
float t;
float d;
float vals[] = new float[800];

void setup(){
  size(1200,400);
  t = 180;
  pos = new PVector(t,0);
  d = 0.005;
}

void draw(){
  background(255);
  noFill();
  pos.rotate(d);
  translate(200,200);
  ellipse(0,0,t*2,t*2);
  line(0,0,pos.x,pos.y);
  fill(0);
  ellipse(pos.x,pos.y,5,5);
  line(0,0,pos.x,0);
  line(pos.x,0,pos.x,pos.y);
  vals[vals.length-1] = pos.y;
  for(int i = 0; i<vals.length-1; i++){
    vals[i] = vals[i+1];
  }
  line(pos.x,pos.y,200,pos.y);
  translate(200,0);
  
  for (int i = 0; i<vals.length; i++){
    ellipse(i,vals[vals.length-1-i],1,1);
  }
  
  if(keyPressed){
    switch(key){
      case 'a':
        t+=0.5;
        pos.setMag(t);
      break;
      case 's':
        t-=0.5;
        pos.setMag(t);
      break;
      case 'z':
      d+=0.001;
      break;
      case 'x':
      d-=0.001;
      break;
      
    }
  }
}

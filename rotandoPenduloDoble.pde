float largoP1 = 100;
float largoP2 = 100; 
float masa1 = random(40); 
float masa2 = random(40); 
float a1 = random(TWO_PI); 
float a2 = random(TWO_PI); 
float va1 = 0; 
float va2 = 0; 
float g = 1; 
float cx, cy;
int n = 5000;
PVector pos[] = new PVector[n];
void setup() {
  size(500, 500); 
  cx = 0;
  cy = 0;
  
  for (int i = 0; i< n; i++){
    float n1 = -g * (2 * masa1 + masa2) * sin(a1);
    float n2 = -masa2 * g * sin(a1-2*a2);
    float n3 = -2*sin(a1-a2)*masa2;
    float n4 = va2*va2*largoP2+va1*va1*largoP1*cos(a1-a2);
    float n5 = largoP1 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na1 = (n1 + n2 + n3*n4) / n5;
    n1 = 2 * sin(a1-a2);
    n2 = (va1*va1*largoP1*(masa1+masa2));
    n3 = g * (masa1 + masa2) * cos(a1);
    n4 = va2*va2*largoP2*masa2*cos(a1-a2);
    n5 = largoP2 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na2 = (n1*(n2+n3+n4)) / n5;
    float x1 = cx+largoP1 * sin(a1);
    float y1 = cy+largoP1 * cos(a1);
    float x2 = x1 + largoP2 * sin(a2);
    float y2 = y1 + largoP2 * cos(a2);
    pos[i] = new PVector(x2,y2);
    va1 += na1;
    va2 += na2;
    a1 += va1;
    a2 += va2;
  }

  //transformaciones
  for(int i = 0; i<pos.length;i++){
    pos[i].rotate(i*0.1);
    
  }
  
 background(255);
 strokeWeight(1);
 stroke(0);
  
  translate(width/2,height/2);
  for(int i = 0; i<pos.length-1;i++){
    line(pos[i].x,pos[i].y,pos[i+1].x,pos[i+1].y);
  }  
}

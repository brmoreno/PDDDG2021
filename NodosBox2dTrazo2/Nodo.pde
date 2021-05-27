class Nodo{
  float x,y;
  
  Nodo(){
    x = mouseX;
    y = mouseY;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(x,y,5,5);
  }
}

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;
ArrayList <Caja> cajas;
Caja una;
ArrayList <Limite> limites;

PGraphics letra;

public void settings() {
  size(500, 500);
}

void setup() {
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0, 0);
  cajas = new ArrayList<Caja>();
  
  limites = new ArrayList <Limite>();
  
  float t= random (0.5, 30);
 
  background(255);

 
  letra = createGraphics(width,height);
  letra.beginDraw();
  letra.textSize(500);
  letra.fill(0);
  letra.text("F",0,400);
  letra.endDraw();
  letra.loadPixels();
  for(int i = 0; i<width; i+= 10){
    for(int j = 0; j<height; j+= 10){
      color c = letra.get(i,j);
      if(c == color(0)){
        cajas.add (new Caja (i,j));
      }
    }
  }
}

void draw() {
  background(255);
  //image(letra,0,0);
  mundo.step();
  for (Caja c : cajas) {
    c.display();
    if(!mousePressed){
      c.fuerza();
    }
  }

  for (Limite l : limites) {
    //l.display();
  } 
}

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;
ArrayList <Nodo> nodos;
PVector ultimo;
float distEntreNodos = 20;
ArrayList <Caja> cajas;

void setup(){
  size(500,500);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0,0);
  background(255);
  nodos = new ArrayList <Nodo>();
  cajas = new ArrayList <Caja>();
}

void draw(){
  background(255);
  mundo.step();
  if(mousePressed){
    float distancia = dist(ultimo.x,ultimo.y,mouseX,mouseY);
    if(distancia > distEntreNodos){
      ultimo = new PVector(mouseX,mouseY);
      nodos.add(new Nodo());
    }  
  }
  
  for(Nodo n:nodos){
    n.display();
  }
  
  for(Caja c:cajas){
    c.display();
    c.fuerza();
  }
}

void mousePressed(){
  ultimo = new PVector(mouseX,mouseY);
  nodos.add(new Nodo());
}

void mouseReleased(){
  for(Nodo n:nodos){
    for(int i = 0; i<10;i++){
      cajas.add(new Caja(n));
    }
  }
}

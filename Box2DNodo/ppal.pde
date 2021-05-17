import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;
ArrayList <Caja> cajas;
Caja una;

ArrayList <Limite> limites;
ArrayList <Nodo> nodos;

void setup(){
  size(500,500);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0,0);
  cajas = new ArrayList<Caja>();

  limites = new ArrayList <Limite>();
  limites.add(new Limite(width/2,0,width,50));
  limites.add(new Limite(width/2,height,width,50));
  limites.add(new Limite(0,height/2,50,height));
  limites.add(new Limite(width,height/2,50,height));
  
  nodos = new ArrayList <Nodo> ();
  for(int i = 0 ; i<10; i++){
    nodos.add(new Nodo(width/2,height/2,random(30,300),random(-100,300)));
  }
  background(255);
}

void draw(){
  //background(255);
  mundo.step();
  for(Caja c:cajas){
    c.display();
    for(Nodo n:nodos){
      c.fuerza(n);
    }
  }
  
  for(Limite l:limites){
    l.display();
  }
  
  for(Nodo n:nodos){
    n.display();
  }
  
}

void keyPressed(){
  cajas.add(new Caja(mouseX,mouseY, 10,10));
}

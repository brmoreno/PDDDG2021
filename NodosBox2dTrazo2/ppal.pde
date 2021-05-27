import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing mundo;
ArrayList <Nodo> nodos;
PVector ultimo;
float distEntreNodos = 20;
ArrayList <Caja> cajas;
ArrayList <Limite> limites;

void setup(){
  size(500,500);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0,-10);
  background(255);
  nodos = new ArrayList <Nodo>();
  cajas = new ArrayList <Caja>();
  limites = new ArrayList <Limite>();
  limites.add(new Limite(width/2,0,width,50));
  limites.add(new Limite(width/2,height,width,50));
  limites.add(new Limite(0,height/2,50,height));
  limites.add(new Limite(width,height/2,50,height));
 
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
    //c.fuerza();
  }
}

void mousePressed(){
  ultimo = new PVector(mouseX,mouseY);
  nodos.add(new Nodo());
}

void mouseReleased(){
  ArrayList <Caja> cajasActuales = new ArrayList <Caja>();
  for(Nodo n:nodos){
    cajasActuales.add(new Caja(n));
  }
  
  for(int i = 0; i< cajasActuales.size()-1; i++){
    for(int j = i+1; j< cajasActuales.size(); j++){
      DistanceJointDef djd = new DistanceJointDef();
      djd.bodyA = cajasActuales.get(i).b;
      djd.bodyB = cajasActuales.get(j).b;
      Vec2 P1 = mundo.getBodyPixelCoord(cajasActuales.get(i).b);
      Vec2 P2 = mundo.getBodyPixelCoord(cajasActuales.get(j).b);
      float distancia = dist(P1.x,P1.y,P2.x,P2.y);
      djd.length = mundo.scalarPixelsToWorld(distancia);
      djd.frequencyHz = 1;
      djd.dampingRatio = 0.3;
      DistanceJoint dj = (DistanceJoint) mundo.world.createJoint(djd);
     }
  }
  
  for(Caja c: cajasActuales){
    cajas.add(c);
  }
  
  nodos = new ArrayList <Nodo>(); 
}

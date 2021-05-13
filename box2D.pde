import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;
ArrayList <Caja> cajas;
Caja una;
ArrayList <PFont> fuentes;
void setup(){
  size(500,500);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0,-10);
  cajas = new ArrayList<Caja>();
  
  fuentes = new ArrayList<PFont>();
  String foo [] = PFont.list();
  for(int i = 0 ; i<30; i++){
    PFont fuente = createFont(foo[floor(random(foo.length))],40);
    fuentes.add(fuente);
  }
}

void draw(){
  background(255);
  mundo.step();
 
  for(Caja c:cajas){
    c.display();
  }
}

void keyPressed(){
  cajas.add(new Caja(mouseX,mouseY, 20,40,key));
}

class Caja{
  float w;
  float h;
  Body b;
  int fuente;
  char l;
  
  Caja(float x_, float y_, float w_, float h_,char l_){
    l = l_;
    fuente = floor(random(30));
    textFont(fuentes.get(fuente));
    w = textWidth(l);
    h = h_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicialEnPix = new Vec2(x_,y_);
    Vec2 posicionInicialBox2D = mundo.coordPixelsToWorld(posicionInicialEnPix);
    bd.position.set(posicionInicialBox2D);
    
    bd.type = BodyType.DYNAMIC;
    b = mundo.createBody(bd);
    b.setLinearVelocity(new Vec2(random(-5,5),random(-5,5)));
    
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w_);
    float alto = mundo.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2, alto/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.5;
    fd.restitution = 1;
    fd.density = 1;
    
    b.createFixture(fd);
    
    
     
  }
  
  void display(){
    Vec2 posicion = mundo.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(-angulo);
    noStroke();
    fill(0);
    textFont(fuentes.get(fuente));
    textAlign(CENTER,TOP);
    text(l,0,0);
    popMatrix();
  }
  
}

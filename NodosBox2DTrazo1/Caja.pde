class Caja{
  float w;
  float h;
  Body b;
  color c;
  char l;
  Nodo n;
  
  Caja(Nodo n_){
    n = n_;
    c= color(random(255),random(20,90),random(100,255));
    w = random(5,15);
    h = random(5,15);
    BodyDef bd = new BodyDef();
    Vec2 posicionInicialEnPix = new Vec2(n.x+random(-500,500),n.y+random(-500,500));
    Vec2 posicionInicialBox2D = mundo.coordPixelsToWorld(posicionInicialEnPix);
    bd.position.set(posicionInicialBox2D);
    bd.type = BodyType.DYNAMIC;
    b = mundo.createBody(bd);
    b.setLinearDamping(0.1);
    b.setAngularDamping(0.1);
    b.setLinearVelocity(new Vec2(random(-5,5),random(-5,5)));
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w);
    float alto = mundo.scalarPixelsToWorld(h);
    ps.setAsBox(ancho/2, alto/2);   
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    fd.density = 1;  
    b.createFixture(fd);    
  }
  
  void fuerza(){
    Vec2 posicion = new Vec2 (n.x,n.y);
    Vec2 objetivo = mundo.coordPixelsToWorld(posicion.x,posicion.y);
    Vec2 VecBody = b.getWorldCenter();
    objetivo.subLocal(VecBody);
    objetivo.normalize();
    objetivo.mulLocal(10);
    b.applyForce(objetivo,VecBody);
  }
  
  void display(){
    Vec2 posicion = mundo.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(-angulo);
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }  
}

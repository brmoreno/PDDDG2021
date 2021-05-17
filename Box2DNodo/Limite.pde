class Limite{
  float x;
  float y;
  float w;
  float h;
  Body b;

  char l;
  
  Limite(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicialEnPix = new Vec2(x_,y_);
    Vec2 posicionInicialBox2D = mundo.coordPixelsToWorld(posicionInicialEnPix);
    bd.position.set(posicionInicialBox2D);
    
    bd.type = BodyType.STATIC;
    b = mundo.createBody(bd);
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
    fill(255,0,0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}

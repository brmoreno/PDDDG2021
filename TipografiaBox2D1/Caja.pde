class Caja {
  float w;
  float h;
  Body b;
  color c;
  float t;
  char s;
  float fx;
  float fy;

  Caja(float x_, float y_) {
    fx = x_;
    fy = y_;
    c= color(random(255), random(255), random(255));
    t =random (2, 10);
    BodyDef bd = new BodyDef();
    Vec2 posicionInicialEnPix = new Vec2(random(width), random(height));
    Vec2 posicionInicialBox2D = mundo.coordPixelsToWorld(posicionInicialEnPix);
    bd.position.set(posicionInicialBox2D);

    bd.type = BodyType.DYNAMIC;
    b = mundo.createBody(bd);

    b.setLinearDamping(0.1);
    b.setAngularDamping(0.1);

 
    CircleShape cs = new CircleShape();
    cs.m_radius = mundo.scalarPixelsToWorld (t/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    fd.density = 1;

    b.createFixture(fd);
  }

  void fuerza() {
    Vec2 objetivo = mundo.coordPixelsToWorld(fx,fy);
    Vec2 VecBody = b.getWorldCenter();
    objetivo.subLocal(VecBody);
    objetivo.normalize();
    objetivo.mulLocal(30);
    b.applyForce(objetivo, VecBody);    
  }

  void display() {
    Vec2 posicion = mundo.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x, posicion.y);
    rotate(-angulo);
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(0, 0, t*2, t*2);
    popMatrix();
  }
}

class ball {
  Vec3D pos;
  float radius;
  Vec3D p1 = new Vec3D(200, 200, 0);
  Vec3D p2 = new Vec3D(250, 200, 0);
  Vec3D p12, p22,pl1;
  boolean UPpressed, DOWNpressed, LEFTpressed, RIGHTpressed;
  Vec3D speed;
  ball() {
    radius=15;
    UPpressed = false;
    DOWNpressed = false;
    RIGHTpressed = false;
    LEFTpressed = false;
    speed=new Vec3D(2, 2, 0);
    pos=new Vec3D(random(100, width-20), random(200, height-20), 0);
  }
  void check() {
    //strokeWeight(0.5);
    line(t1.x,t1.y,t2.x,t2.y);
  }
  void run() {
    //move();
    keymove();
    bounce();
    display();
  }
  void keymove() {
    if (UPpressed) {
      pos.y-=speed.y;
    }
    if (DOWNpressed) {
      pos.y+=speed.y;
    }
    if (LEFTpressed) {
      pos.x-=speed.x;
    }
    if (RIGHTpressed) {
      pos.x+=speed.x;
    }
  }
  void heroKeyPressed()
  {
    //keyReleased = false;
    if (keyCode == UP) {
      UPpressed = true;
    }
    if (keyCode == DOWN) {
      DOWNpressed = true;
    }
    if (keyCode == LEFT) {
      LEFTpressed = true;
    }
    if (keyCode == RIGHT) {
      RIGHTpressed = true;
    }
  }
  void heroKeyReleased() {
    //keyReleased = true;
    if (keyCode == UP) {
      UPpressed = false;
    }
    if (keyCode == DOWN) {
      DOWNpressed = false;
    }
    if (keyCode == LEFT) {
      LEFTpressed = false;
    }
    if (keyCode == RIGHT) {
      RIGHTpressed = false;
    }
  }

  void move() {
    pos.addSelf(speed);
  }
  void display() {
    fill(100, 0, 0);
    ellipse(pos.x, pos.y, radius, radius);
    stroke(255);
    point(pos.x, pos.y);
    stroke(0,0,255);
    point(t2.x,t2.y);
    point(t1.x,t2.y);
    Vec3D temp = t2.sub(t1);
    Vec3D temp1 = t2.sub(pos);
    temp.normalizeTo(50);
    p12=p1.add(temp);
    temp1.normalizeTo(50);
    p22=p2.add(temp1);
    stroke(0, 255, 0);
    //line(200, 200, p12.x, p12.y);
    stroke(255, 0, 0);
    line(250, 200, p22.x, p22.y);
    //println(temp1.x+"\t\t"+temp1.y+"\t"+temp.x+"\t"+temp.y);
    Vec3D t0 = temp1.sub(temp);
    //println((t0.x)+"\t"+(t0.y));
    if (true) {
      if ((t0.x)>0 && (t0.y)>0)
      {
        //abounce();
        println("triggered");
      }
    }
    line(pos.x,pos.y,t2.x,t2.y);
    line(pos.x,pos.y,t1.x,t1.y);
    Vec3D lp1 = t1.sub(pos);
    lp1.normalizeTo(50);
    pl1=p2.add(lp1);
    //pl1.normalizeTo(50);
    line(p2.x,p2.y,pl1.x,pl1.y);
    println(temp1.x+"\t"+temp1.y+"\t"+lp1.x+"\t"+lp1.y); 
    Vec3D mul=lp1.scale(-1);
    //println(mul.x+"\t"+mul.y+"\t"+temp1.x+"\t"+temp1.y+"\t"+lp1.x+"\t"+lp1.y);
    Vec3D finalsub=temp1.add(lp1);
    //println(finalsub.x+"\t\t"+finalsub.y);
    float a=pos.distanceTo(t1);
    float b=pos.distanceTo(t2);
    //println(a+"\t"+b);
    if(a*b<0){
    if(a>b){
    Vec3D anotherTemp = temp.scale(-1);
    Vec3D fsuba = anotherTemp.sub(lp1);
    println(fsuba.x+"\t"+fsuba.y);
    }
    if(a<b){
    Vec3D anotherTemp = temp.scale(1);
    Vec3D fsuba = anotherTemp.sub(temp1);
    println(fsuba.x+"\t"+fsuba.y);
    }}
    else
    {
    //println("outside");
    }
}
  void abounce() {
    Vec3D deflection = new Vec3D(-(y2-y1), (x2-x1), 0);
    deflection.normalizeTo(2);
    speed.normalize();
    Vec3D a0=speed.copy();
    speed=a0.add(deflection);
    speed.normalizeTo(2);
  }
  void bounce() {
    if (pos.x<radius/2||pos.x>width-radius/2)
      speed.x*=-1;
    if (pos.y<radius/2||pos.y>height-radius/2)
      speed.y*=-1;
  }
}


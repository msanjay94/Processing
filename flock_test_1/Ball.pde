class Ball
{
  Vec3D loc = new Vec3D();
  Vec3D speed = new Vec3D();
  Vec3D acc = new Vec3D();
  float radius;
  float R,G,B;

  Ball(Vec3D loc, Vec3D speed) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    radius=5;
    this.R=255;
    this.G=255;
    this.B=255;
  }
  void update(){
    loc.x=mouseX;
    loc.y=mouseY;
  }
  void run() {
    display();
    move();
    bounce();
    //lineBetween();
    flock();
  }
  void flock() {
    separation(10.0);
    //cohesion();
    //align();
  }
  void setColor(float R, float G, float B){
    this.R=R;
    this.G=G;
    this.B=B;
  }
  void setSize(float size){
    this.radius=size/2;
  }
  void lineBetween() {
    for (int i =0; i<ballColl.size (); i++) {
      Ball other = (Ball) ballColl.get(i);
      if (loc.distanceTo(other.loc)<40) {
        stroke(255, 0, 0);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }
  
  void separation(float magnitude){
    Vec3D steer = new Vec3D();
    //Vec3D diff = new Vec3D();
    int count=0;
    for (int i =0; i<ballColl.size (); i++) {
      Ball other = (Ball) ballColl.get(i);
      if (loc.distanceTo(other.loc)>0 && loc.distanceTo(other.loc)<20) {
        Vec3D diff=loc.sub(other.loc);
        diff.normalizeTo(1.0/loc.distanceTo(other.loc));
        steer.addSelf(diff);
        count++;
      }
    }
    
    if(count>0){
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }
    
  void display() {
    fill(R,G,B);
    stroke(R,G,B);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  void move() {
    speed.addSelf(acc);
    speed.limit(2);
    loc.addSelf(speed);
    speed.x=speed.x - speed.x/100;
    speed.y=speed.y - speed.y/100;
    acc.clear();
  }
  void bounce() {
    if (loc.x<=0+radius) {
      speed.x*=-1;
      loc.x=radius+1;
    }
    if (loc.x>=width-radius) {
      speed.x*=-1;
      loc.x=width-radius-1;
    }
    if (loc.y>=height-radius) {
      speed.y*=-1;
      loc.y=height-radius-1;
    }
    if (loc.y<=radius) {
      speed.y*=-1;
      loc.y=radius+1;
    }
  }
}


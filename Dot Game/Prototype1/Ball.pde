class Ball {
  Vec3D loc, speed, deceleration;
  float radius;
  int R=255, G=255, B=255;
  Boolean moving=false;
  int iPath, jPath;
  Vec3D iVec, jVec, random=new Vec3D(0, 0, 0);
  Boolean notStarted = true;

  void randomize() {
    random=new Vec3D(random(-1, 1), random(-1, 1), 0);
    random.normalizeTo(random(0.5, 1));
  }
  void setColor(int R, int G, int B) {
    this.R=R;
    this.G=G;
    this.B=B;
  }
  void runEvil() {
    display();
    move();
    Bounce();
    ballStop();
    //followPath();
  }

  Ball(Vec3D loc, Vec3D speed) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    radius=10;
  }
  void startBall(Vec3D speed) {
    moving=true;
    notStarted=false;
    this.speed=speed.copy();
  }
  void run() {
    display();
    move();
    Bounce();
    ballStop();
    addTrace();
    liveTrace();
    if (path.size()>1) {
      tracePath();
    }
  }
  void liveTrace() {
    Vec3D temp = (Vec3D)path.get(path.size()-1);
    //println(path.size() + "\t" + temp.x + "\t" + temp.y);
    stroke(255, 255, 0);
    line(temp.x, temp.y, loc.x, loc.y);
  }
  void addTrace() {
    if (moving==false) { 
      Vec3D temp = (Vec3D)path.get(path.size()-1);
      //println(path.size() + "\t" + temp.x + "\t" + temp.y);
      if (temp.x!=loc.x || temp.y!=loc.y) {
        Vec3D xtemp = new Vec3D(loc.x, loc.y, 0);
        path.add(xtemp);
      }
    }
  }
  void tracePath() {
    for (iPath=0; iPath< (path.size ()-1); iPath++) {
      jPath=iPath+1;
      iVec = (Vec3D)path.get(iPath);
      jVec = (Vec3D)path.get(jPath);
      stroke(0, 255, 0);
      line(iVec.x, iVec.y, jVec.x, jVec.y);
    }
  }

  void ballStop() {
    if (moving) {
      if ((abs(speed.x)<=0.02) && (abs(speed.y)<=0.02)) {
        {
          moving=false;
          //path.add(loc);
          speed.x=0;
          speed.y=0;
          if (!notStarted)
          {
            turn*=-1;
          }//turn=-1;
        }
      }
    }
  }
  void Bounce() {
    if (loc.x<=73+radius) {
      //speed.x*=-1;
      //loc.x=radius;
      speed.x=0;
      speed.y=0;
      loc.x=73+radius;
    }
    if (loc.y<=82+radius) {
      //speed.y*=-1;
      //loc.y=radius;
      speed.x=0;
      speed.y=0;
      loc.y=82+radius;
    }
    if (loc.x>=354-radius) {
      //speed.x*=-1;
      speed.x=0;
      speed.y=0;
      loc.x=354-radius;
    }
    if (loc.y>=height-radius) {
      //speed.y*=-1;
      speed.x=0;
      speed.y=0;
      loc.y=height-radius;
    }
  }
  void display() {
    fill(R, G, B);
    stroke(R,G,B);
    ellipse(loc.x, loc.y, radius*2, radius*2);
    //println(speed.x+"\t"+speed.y);
  }
  void move() {
    loc.addSelf(speed);
    speed.x-=speed.x/100;
    speed.y-=speed.y/100;
  }
}


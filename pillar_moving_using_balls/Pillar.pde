class Pillar {
  Vec3D loc, speed;
  float rectWidth;
  float rectHeight;
  Boolean alive;
  Pillar(Vec3D loc, Vec3D speed, float rectWidth, float rectHeight) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    this.rectWidth=rectWidth;
    this.rectHeight=rectHeight;
    alive=true;
  }
  void run()
  {
    display();
    move();
  }
  void display() {
    if (alive) {
      fill(255);
      stroke(255);
      rect(loc.x, loc.y, rectWidth, rectHeight);
      rect(loc.x, loc.y+rectHeight+150, rectWidth, height);
    } else {
      loc.x=-1;
      loc.y=-1;
      speed.x=0;
      speed.y=0;
    }
  }
  void update() {
    loc.y=mouseY;
  }
  void move() {
    loc.addSelf(speed);
  }
  
}


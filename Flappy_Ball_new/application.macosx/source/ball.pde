class Ball
{
  Vec3D loc, speed;
  float radius;
  float gravity;
  Ball(Vec3D loc, Vec3D speed, float radius, float gravity) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    this.radius=radius;
    this.gravity=gravity;
  }
  void run() {
    display();
    gravity();
    checkBoundary();
  }
  void display() {
    loc.addSelf(speed);
    fill(255);
    stroke(255);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  void gravity(){
    speed.y+=gravity;
    speed.limit(5);
  }
  void jump(){
    if(loc.y>=radius+5){
      speed.y=-20;
    }
  }
  void checkBoundary()
  {
    if (loc.y<=0) {
      loc.y=radius;
      speed.y=0;
    }
    if (loc.y>=height-radius) {
      javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore : "+flap.score/68+"\nA game by Sanjay");
      reset();
      //System.exit(0);
    }
  }
  void update() {
    loc.y=mouseY;
  }
  void check(Pillar p) {
    if (this.loc.x>=(p.loc.x-this.radius) && this.loc.x<=(p.loc.x+this.radius+this.radius+p.rectWidth)) {
      if (this.loc.y>=(p.loc.y-this.radius) && this.loc.y<=(p.loc.y+p.rectHeight+this.radius )) {
        javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore:"+flap.score/68+"\nA game by Sanjay");
        reset();
        //System.exit(0);
      } else if (this.loc.y>=p.loc.y-this.radius+p.rectHeight+150) {
        javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore : "+flap.score/68+"\nA game by Sanjay");
        reset();
        //System.exit(0);
      } else {
        if (flap.hitPillarChange=true) {
          flap.score++;
          flap.hitPillarChange=false;
        }
      }
    }
  }
}

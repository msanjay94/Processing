import toxi.geom.*;
ArrayList ballColl = new ArrayList();
Ball myBall;
void setup()
{
  size(600, 600);
  smooth();
  for (int i=0; i<200; i++) {
    //Ball b = new Ball(new Vec3D(random(0, width), random(0, height), 0), new Vec3D(random(-2, 2), random(-2, 2), 0));
    Ball b = new Ball(new Vec3D(random(0, width), random(0, height), 0), new Vec3D(0,0, 0));
    ballColl.add(b);
  }
  //myBall = new Ball(new Vec3D(mouseX,mouseY,0), new Vec3D());
  myBall = new Ball(new Vec3D(), new Vec3D());
  ballColl.add(myBall);
  myBall.setColor(255,0,0);
  myBall.setSize(20);
}
void draw() {
  background(0);
  myBall.update();
  for (int i=0; i<200; i++) {
    Ball mb=(Ball)ballColl.get(i);
    mb.run();
  }
  myBall.display();
}


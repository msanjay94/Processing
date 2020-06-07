import toxi.geom.*;
ball b;
float x1 = 100;
  float x2 = 300;//200
  float y1=50;//133
  float y2=50;
  Vec3D per = new Vec3D(-(y2-y1), (x2-x1), 0);
  Vec3D t11=new Vec3D(x1,y1,0);
  Vec3D t21=new Vec3D(x2,y2,0);
  Vec3D t1=new Vec3D(x1,y1,0);
  Vec3D t2=new Vec3D(x2,y2,0);
  void setup() {
  
  
  size(400, 400);
  smooth();
  b=new ball();
}
void draw() {
  
  //translate(200,200);
  background(0);
  strokeWeight(2);
  stroke(255);
  
  line(x1,y1,x2,y2);
  //line(-(y2-y1),x2-x1,y2-y1,-(x2-x1));
  //line(x1,x2,y1,y2);
  //line(x1,y1,x2,y1);
  //line(x2,y2,x2,y1);
  //line(x1,x2,y1,x2);
  //line(y1,x1,y1,x2);
  //line(0,0,-(y2-y1),(x2-x1));
  b.check();
  b.run();
  per.normalizeTo(9);
  stroke(0,0,255);
  strokeWeight(2);
  //line(0,0,per.x,per.y);
  t1=t11.add(per);
  t2=t21.add(per);
}
void keyPressed() {
  b.heroKeyPressed();
}
void keyReleased() {
  b.heroKeyReleased();
}


import toxi.geom.*;
Vec3D v1 = new Vec3D(100, 150, 0);
Vec3D v2 = new Vec3D(129, 140, 0);
void setup() {
  size(600, 600);
  smooth();
}
void draw() {
  background(0);
  translate(width/2,height/2);
  strokeWeight(1);
  stroke(127);
  line(0, 200, 0, -200);
  line(200, 0, -200, 0);
  stroke(255, 0, 0);
  display(v1);
  stroke(0, 255, 0);
  display(v2);
  Vec3D newVec = v1.sub(v2);;
  stroke(0, 255, 255);
  newVec.normalizeTo(1/v1.distanceTo(v2));
  println(newVec.x,newVec.y,(sqrt((newVec.x*newVec.x) +(newVec.y*newVec.y))));
  display(newVec);
} 
void display(Vec3D v) {
  strokeWeight(5);
  point(v.x, v.y);
  strokeWeight(1);
  stroke(0, 0, 255);
  line(0, 0, v.x, v.y);
}


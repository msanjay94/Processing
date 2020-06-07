import toxi.geom.*;
ball b;
PVector t1, t2, t11,left,right;
void setup() {
  size(400, 400);
  smooth();
  b=new ball();
  t1=new PVector(62, 306);
  t2=new PVector(200,60);
  t11=new PVector();
  left = new PVector(50,60);
  right= new PVector(350,60);
}
void drawLineVec(PVector a1,PVector a2) {
  strokeWeight(1);
  stroke(0, 0, 255);
  line(a2.x, a2.y, a1.x, a1.y);
  stroke(0, 255, 0);
  point(a1.x, a1.y);
  point(a2.x,a2.y);
  //rectMode(CENTER);
}
void draw() {
  println(mouseX+"\t"+mouseY);
  background(0);
  fill(255);
  stroke(255);
  rect(50, 50, 300, 10);
  drawLineVec(t1, t2);
  drawPerpen(left,right);
}
void drawPerpen(PVector lt1, PVector lt2){
PVector nt1= new PVector(-(lt2.y-lt1.y),(lt2.x-lt1.x));
Vec3D e1 = new Vec3D(nt1.x,nt1.y,0);
Vec3D start = new Vec3D(lt2.x,lt2.y,0);
Vec3D mid = new Vec3D(200,60,0);
Vec3D perpen = mid.add(e1);
PVector newPer = new PVector(perpen.x,perpen.y);
PVector startP = new PVector(mid.x,mid.y);
drawLineVec(startP,newPer);
//println(degrees(PVector.angleBetween()))
angle(startP,newPer);
}
void angle(PVector lt1, PVector lt2){
PVector nt1 = new PVector (t1.x,t1.y);
nt1.sub(t2);
lt2.sub(lt1);
println(degrees(PVector.angleBetween(nt1,lt2)));
createNew(lt1,lt2,degrees(PVector.angleBetween(nt1,lt2)));
}
void createNew(PVector l1, PVector l2, float angle){
PVector temp = new PVector(l2.x,l2.y);
temp.sub(l1);
temp.rotate(angle);
temp.add(l1);
drawLineVec(l1,temp);
}


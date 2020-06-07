import toxi.geom.*;
int i=0, score=0;
int lastPillar=0;
int pillars, hitPillar=0;
Boolean hitPillarChange=true;
Pillar temp1, temp2, temp3, temp4, hit;
Ball heroBall;
//Ball currentBall, hitBall, lastBall, newBall;
ArrayList pillarColl=new ArrayList();
;
void setup() {
  size(320, 480);
  smooth();
  Pillar b=new Pillar(new Vec3D(width+50, 0, 0), new Vec3D(-1, 0, 0), 45, random(35, 320));
  pillarColl.add(b);
  heroBall=new Ball(new Vec3D(40, 0, 0), new Vec3D(0, 1, 0), 10,0.3);
}
void draw() {
  background(0);
  frameRate(60);
  heroBall.run();
  hit=(Pillar)pillarColl.get(hitPillar);
  heroBall.check(hit);
  for (pillars=lastPillar; pillars<=i; pillars++) {
    temp1=(Pillar)pillarColl.get(pillars);
    temp1.run();
  }
  if (temp1.loc.x<=width-90) {
    createPillar();
  }
  temp2=(Pillar)pillarColl.get(lastPillar);
  if (temp2.loc.x<=20) {
    hitPillar=lastPillar+1;
    hitPillarChange=true;
  }
  if (temp2.loc.x<=-45) {
    killPillar();
  }
  //println("Balls created="+(i+1)+"\tBalls killed="+(lastPillar+1)+"\tHitball="+(hitPillar+1)+"\tScore:"+score);
}
void createPillar() {
  Pillar b=new Pillar(new Vec3D(width+50, 0, 0), new Vec3D(-1, 0, 0), 45, random(35, 320));
  pillarColl.add(b);
  i++;
}
void killPillar() {
  temp4=(Pillar)pillarColl.get(lastPillar);
  temp4.alive=false;
  lastPillar++;
}
void mousePressed(){
  heroBall.jump();
}


class flappy {
  int i=0, score=0;
  int lastPillar=0;
  int pillars, hitPillar=0;
  Boolean hitPillarChange=true;
  Pillar temp1, temp2, temp3, temp4, hit;
  Ball heroBall;
  //Ball currentBall, hitBall, lastBall, newBall;
  ArrayList pillarColl=new ArrayList();
  PFont f1;
  void fsetup() {
    size(320, 480);
    smooth();
    f1=createFont("Bitstream Charter Bold", 15);
    fill(255, 0, 0);
    textFont(f1);
    textSize(20);
    //text("Score:"+(score/30), width/2-40, 20);
    Pillar b=new Pillar(new Vec3D(width+50, 0, 0), new Vec3D(-1, 0, 0), 45, random(35, 320));
    pillarColl.add(b);
    heroBall=new Ball(new Vec3D(40, 0, 0), new Vec3D(0, 1, 0), 10, 0.3);
  }
  void fdraw() {
    background(0);
    frameRate(60);
    heroBall.run();
    //heroBall.update();
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
    if (temp2.loc.x<=-18) {
      hitPillar=lastPillar+1;
      hitPillarChange=true;
    }
    if (temp2.loc.x<=-45) {
      killPillar();
    }
    //println("Balls created="+(i+1)+"\tBalls killed="+(lastPillar+1)+"\tHitball="+(hitPillar+1)+"\tScore:"+score);
    fill(255, 0, 0);
    textFont(f1);
    textSize(20);
    text("Score:"+(score/68), width/2-40, 20);
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
  void fmousePressed() {
    heroBall.jump();
  }
}

import toxi.geom.*;
Hero hero;
generator g;
Collectibles[] c = new Collectibles[13];
Obstacles[] obs = new Obstacles[124];
int Deaths = 0;
boolean obsReady = false;
void setup() {
  size(1200, 450);
  smooth();
  rectMode(CENTER);
  hero = new Hero(100, 75, 2.5);
  g= new generator();
  createCollectibles();
createObstacles();
}
void draw() {
  frameRate(30);
  basicUI();
  hero.run();
  g.run();
  runCollectibles();
  if(obsReady)
  runObstacles();
  fill(0);
  textSize(15);
  text("Deaths:"+Deaths,width/2, 73);
}
void keyPressed() {
  hero.heroKeyPressed();
}
void keyReleased() {
  hero.heroKeyReleased();
}
void createCollectibles(){
c[0] = new Collectibles(new Vec3D(g.cx1,112+60,0),false);
c[1] = new Collectibles(new Vec3D(g.cx1,height-50-12-60,0),false);
c[2] = new Collectibles(new Vec3D(g.cx2,112+60,0),false);
c[3] = new Collectibles(new Vec3D(g.cx2,height-50-12-60,0),false);
c[4] = new Collectibles(new Vec3D(g.cx3,112+60,0),false);
c[5] = new Collectibles(new Vec3D(g.cx3,height-50-12-60,0),false);
c[6] = new Collectibles(new Vec3D(g.cx4,112+60,0),false);
c[7] = new Collectibles(new Vec3D(g.cx4,height-50-12-60,0),false);
c[8] = new Collectibles(new Vec3D(50+12,g.cy1,0),false);
c[9] = new Collectibles(new Vec3D(width-50-12,g.cy4,0),false);
c[10] = new Collectibles(new Vec3D((g.cx1+g.cx2)/2,height/2+15,0),false);
c[11] = new Collectibles(new Vec3D((g.cx2+g.cx3)/2,height/2+15,0),false);
c[12] = new Collectibles(new Vec3D((g.cx3+g.cx4)/2,height/2+15,0),false);

}
void runCollectibles(){
  for(int i=0;i<13;i++)
  c[i].run();
}
void collectiblesReset(){
  for(int i=0;i<13;i++)
  c[i].isCollected=false;
}
void createObstacles(){
  for(int i=0;i<124;i++)
   obs[i]=new Obstacles(new Vec3D(0,0,0));
}
void runObstacles(){
  for(int i=0;i<124;i++)
   obs[i].run();
}

import peasy.*;
import toxi.geom.*;
int cols=20,rows=20;
Point[][] grid=new Point[rows][cols];
int x=0, y=0, z=0;
int w=40,h=80,d=120;
int gsize=20;
PrintWriter writer;
PeasyCam sam;
void setup() {
  writer=createWriter("data/points.csv");
  size(600, 600, P3D);
  fill(255,0,0);
  line(0,0,0,100,0,0);
  fill(0,255,0);
  line(0,0,0,0,100,0);
  fill(0,0,255);
  line(0,0,0,0,0,100);
  sam=new PeasyCam(this,100);
  for(int i=0;i<20;i++)
  for(int j=0;j<20;j++)
  {
    float z = random(0,40);
  Vec3D loc = new Vec3D(i*gsize,j*gsize,z);
  grid[i][j] = new Point(loc);
  }
}
void draw() {
  //translate(300,300,0);
  background(0);
  noFill();
  stroke(255);
  box(600);
  //camera(200, 200, 200, 0, 0, 0, x, y, z);
  //stroke(2);
  //fill(255,255,255);
  //point(40,80,120);
  println((x)+" "+(y)+" "+(z));
  for(int i=0;i<20;i++)
  for(int j=0;j<20;j++)
  grid[i][j].run();
}
void keyPressed() {
  //println(keyCode);
  if (keyCode == 88)
    x=(x==0)?1:0;
  if (keyCode == 89)
    y=(y==0)?1:0;
  if (keyCode == 90)
    z=(z==0)?1:0;
  if(keyCode ==87)
    w=w+5;
  if(keyCode ==69)
    w=w-5;
  if(keyCode ==82)
    h=h+5;
  if(keyCode ==84)
    h=h-5;
  if(keyCode ==85)
    d=d+5;
  if(keyCode ==73)
    d=d-5;
  for(int i=0;i<20;i++)
  for(int j=0;j<20;j++)
  writer.println(grid[i][j].loc.x+","+grid[i][j].loc.y+","+grid[i][j].loc.z);
}


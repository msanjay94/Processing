import toxi.geom.*;
import peasy.*;
PeasyCam cam;
int rows=100;
int cols=100;
CA grid[][]=new CA[rows][cols];
boolean start= false;

void setup() {
  size(800, 600, P3D);
  smooth();
  cam = new PeasyCam(this, 500,500,0, 2500);
  for (int i=0; i<rows; i++)
    for (int j=0; j<cols; j++) {
      Vec3D ptLoc = new Vec3D(i*20, j*20, 0);
      grid[i][j]=new CA(ptLoc, i, j);
    }
  setType();
}
void setType() {
  grid[1][1].type=1;
  grid[1][2].type=1;
  grid[1][3].type=1;
  grid[1][5].type=1;
  grid[2][1].type=1;
  grid[3][4].type=1;
  grid[3][5].type=1;
  grid[4][2].type=1;
  grid[4][3].type=1;
  grid[4][5].type=1;
  grid[5][1].type=1;
  grid[5][3].type=1;
  grid[5][5].type=1;
  /*grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   grid[][].type=1;
   */
}
void draw() {
  background(0);
  if (true) {
    for (int i=0; i<rows; i++)
      for (int j=0; j<cols; j++)
        grid[i][j].run();
    for (int i=0; i<rows; i++)
      for (int j=0; j<cols; j++)
        grid[i][j].updateType();
  }
}
void keyPressed() {
  if (key == 's')
    start = true;
}


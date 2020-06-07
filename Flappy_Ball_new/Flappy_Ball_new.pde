
import toxi.geom.*;
flappy flap = new flappy();
void setup() {
  flap.fsetup();
}
void draw() {
  flap.fdraw();
}
void mousePressed() {
  flap.fmousePressed();
}
void keyPressed() {
  if (keyCode==32)
    flap.fmousePressed();
}

void reset() {
  flap=new flappy();
  flap.fsetup();
  flap.fdraw();
}


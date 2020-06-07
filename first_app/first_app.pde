void setup() {
  size(640, 700);
  //background(0);
  smooth();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  background(255);
  leftRect();
  rightRect();
  if (x <=21 ) {
    x=21;
  }
  if (x>=619) {
    x=619;
  }
  if (y<=21) {
    y=21;
  }
  if (y>=689) {
    y=679;
  }
  if ( x < 320 ) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(x, y, 40, 40);
  } else {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(x, y, 40, 40);
  }
  stroke(255);
  fill(255);
  rect(315, 0, 10, 960);
}

void leftRect() {
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(0, 0, 315, 700);
}

void rightRect() {
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(325, 0, 400, 700);
}


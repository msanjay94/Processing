class Obstacle1 {
  float xPos;
  float yPos;
  float obsSpeed;
  Obstacle1(float x, float y, float speed) {
    xPos = x;
    yPos = y;
    obsSpeed = speed;
  }
  void run()
  {
    yPos = yPos + obsSpeed;
    if ( yPos >= 168) {
      obsSpeed = -1 * obsSpeed;
    }
    if (yPos <= 32) {
      obsSpeed = -1 * obsSpeed;
    }
    stroke(0);
    fill(66, 56, 185);
    ellipse(xPos, yPos, 14, 14);
  }
}


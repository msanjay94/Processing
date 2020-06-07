class Obstacles {
  Vec3D pos;
  float obsSpeed;
  boolean display;
  Obstacles(Vec3D pos1) {
    pos=pos1.copy();
    display = true;
  }
  void pointObs(float x, float y) {
    pos.x=x;
    pos.y=y;
    display=true;
  }
  void run() {
    if (display) {
      stroke(0);
      fill(66, 56, 185);
      ellipse(pos.x, pos.y, 14, 14);
    }
  }
}


class Collectibles1 {
  float x;
  float y;
  Boolean isCollected;
  Collectibles1(float x, float y, Boolean collected) {
    this.x=x;
    this.y=y;
    this.isCollected=collected;
  }
  void run() {
    collected();
    if (!isCollected) {
      fill(255, 255, 0);
      stroke(0);
      ellipse(x, y, 10, 10);
    }
  }
  void collected() {
    if (hero1.hero1X >= x-13 && hero1.hero1X <= x+13) {
      if (hero1.hero1Y>= y-13 && hero1.hero1Y <= y+13) {
        this.isCollected = true;
      }
    }
  }
}


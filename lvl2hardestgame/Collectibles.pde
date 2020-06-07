class Collectibles {
  Vec3D pos;
  Boolean isCollected;
  Collectibles(Vec3D pos1, Boolean collected) {
    pos=pos1.copy();
    isCollected=collected;
  }
  void run() {
    collected();
    if (!isCollected) {
      fill(255, 255, 0);
      stroke(0);
      ellipse(pos.x, pos.y, 10, 10);
    }
  }
  void collected() {
    if (hero.hero.x >= pos.x-(5+hero.heroSize/2) && hero.hero.x <= pos.x+(5+hero.heroSize/2)) {
      if (hero.hero.y >= pos.y-(5+hero.heroSize/2) && hero.hero.y <= pos.y+(5+hero.heroSize/2)) {
        this.isCollected=true;
      }
    }
  }
}


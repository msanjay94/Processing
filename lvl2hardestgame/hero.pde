class Hero {
  Vec3D hero, start;
  float heroSpeed, heroSize;
  Boolean UPpressed, DOWNpressed;
  Boolean RIGHTpressed;
  Boolean LEFTpressed;
  Boolean victory;
  Hero(float x, float y, float speed) {
    hero = new Vec3D(x, y, 0);
    start = new Vec3D(x, y, 0);
    heroSpeed=speed;
    UPpressed = false;
    DOWNpressed = false;
    RIGHTpressed = false;
    LEFTpressed = false;
    victory = false;
    heroSize=20;
  }
  void run() {
    display();
    move();
    check();
    victory();
    checkBoundary();
  }
  void victory() {
    if (hero.x > width-150 && hero.y < 100) {
      for (int i=0; i<13; i++) {
        if (c[i].isCollected==true) {
          victory=true;
        } else {
          victory=false;
        }
      }
      if (victory) {
        //println("VICTORY");
        javax.swing.JOptionPane.showMessageDialog(frame, "VICTORY!!! CONGRATZ!!");
        System.exit(0);
      }
    }
  }
  void check() {
    for (int i = 0; i< 124; i++) {
      if (hero.x >= obs[i].pos.x - 17 && hero.x <= obs[i].pos.x + 17) {
        if (hero.y >= obs[i].pos.y - 17 && hero.y <= obs[i].pos.y + 17) {
          hero.x=start.x;
          hero.y=start.y;
          collectiblesReset();
          Deaths++;
        }
      }
    }
  }
  void display() {
    stroke(0);
    fill(255, 0, 0);
    rect(hero.x, hero.y, heroSize, heroSize);
  }
  void move() {
    if (UPpressed) {
      hero.y-=heroSpeed;
    }
    if (DOWNpressed) {
      hero.y+=heroSpeed;
    }
    if (LEFTpressed) {
      hero.x-=heroSpeed;
    }
    if (RIGHTpressed) {
      hero.x+=heroSpeed;
    }
  }
  void heroKeyPressed()
  {
    //keyReleased = false;
    if (keyCode == UP) {
      UPpressed = true;
    }
    if (keyCode == DOWN) {
      DOWNpressed = true;
    }
    if (keyCode == LEFT) {
      LEFTpressed = true;
    }
    if (keyCode == RIGHT) {
      RIGHTpressed = true;
    }
  }
  void heroKeyReleased() {
    //keyReleased = true;
    if (keyCode == UP) {
      UPpressed = false;
    }
    if (keyCode == DOWN) {
      DOWNpressed = false;
    }
    if (keyCode == LEFT) {
      LEFTpressed = false;
    }
    if (keyCode == RIGHT) {
      RIGHTpressed = false;
    }
  }
  void checkBoundary() {
    checkBoundaryLine('l', new Vec3D(50, 50, 0), new Vec3D(50, height-50, 0));
    checkBoundaryLine('d', new Vec3D(50, height-50, 0), new Vec3D(width-50, height-50, 0));
    checkBoundaryLine('r', new Vec3D(width-50, 50, 0), new Vec3D(width-50, height-50, 0));
    checkBoundaryLine('u', new Vec3D(50, 50, 0), new Vec3D(150, 50, 0));
    checkBoundaryLine('r', new Vec3D(150, 50, 0), new Vec3D(150, 100, 0));
    checkBoundaryLine('u', new Vec3D(150, 100, 0), new Vec3D(width-150, 100, 0));
    checkBoundaryLine('l', new Vec3D(width-150, 50, 0), new Vec3D(width-150, 100, 0));
    checkBoundaryLine('u', new Vec3D(width-150, 50, 0), new Vec3D(width-50, 50, 0));
  }
  void checkBoundaryLine(char boundary, Vec3D p1, Vec3D p2) {
    if (boundary == 'u') {
      if (hero.x<p2.x && hero.x>p1.x)
        if (hero.y<p1.y+heroSize/2 && hero.y>p1.y-3)
          hero.y=p1.y+1+heroSize/2;
    }
    if (boundary == 'l') {
      if (hero.y>p1.y && hero.y<p2.y)
        if (hero.x<p1.x+heroSize/2 && hero.x>p1.x-3)
          hero.x=p1.x+1+heroSize/2;
    }
    if (boundary == 'r') {
      if (hero.y>p1.y && hero.y<p2.y)
        if (hero.x>p1.x-heroSize/2 && hero.x<p1.x+3)
          hero.x=p1.x-1-heroSize/2;
    }
    if (boundary == 'd') {
      if (hero.x<p2.x && hero.x>p1.x)
        if (hero.y>p1.y-heroSize/2 && hero.y < p1.y+3)
          hero.y=p1.y-1-heroSize/2;
    }
  }
}


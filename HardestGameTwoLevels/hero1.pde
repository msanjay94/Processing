class Hero1 {
  float hero1X, hero1Y, startX, startY;
  float heroSpeed;
  Boolean UPpressed;
  Boolean DOWNpressed;
  Boolean RIGHTpressed;
  Boolean LEFTpressed;
  Boolean victory;
  Hero1(float x, float y, float speed) {
    hero1X=x;
    hero1Y=y;
    startX=x;
    startY=y;
    heroSpeed=speed;
    UPpressed = false;
    DOWNpressed = false;
    LEFTpressed = false;
    RIGHTpressed = false;
    victory = false;
  }
  void run() {
    display();
    move();
    //check();
    victory();
  }
  void display() {
    stroke(0);
    fill(255, 0, 0);
    if ( hero1X < 33 ) {
      hero1X=33;
    }
    if ( hero1X >= 567) {
      hero1X=567;
    }
    if (hero1Y < 33) {
      hero1Y=33;
    }
    if (hero1Y >= 167) {
      hero1Y=167;
    }
    rect(hero1X, hero1Y, 16, 16);
  }
  void move() {
    if (UPpressed) {
      hero1Y-=heroSpeed;
    }
    if (DOWNpressed) {
      hero1Y+=heroSpeed;
    }
    if (LEFTpressed) {
      hero1X-=heroSpeed;
    }
    
      if (RIGHTpressed) {
        hero1X+=heroSpeed;
      }
  }
  void hero1KeyPressed()
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
  void hero1KeyReleased() {
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
  void check() {
    for (int i = 0; i< 6; i++) {
      if (hero1X >= obs1[i].xPos - 15 && hero1X <= obs1[i].xPos + 15) {
        if (hero1Y >= obs1[i].yPos - 15 && hero1Y <= obs1[i].yPos + 15) {
          //println("HIT");
          hero1X=startX;
          hero1Y=startY;
          Deaths++;
        }
      }
    }
  }
  void victory() {
    if (hero1X > 483) {
      for (int i=0; i<6; i++) {
        if (c1[i].isCollected==true) {
          victory=true;
        } else {
          victory=false;
        }
      }
      if (victory) {
        //println("VICTORY");
        UPpressed = false;
        DOWNpressed = false;
        LEFTpressed = false;
        RIGHTpressed = false;
        //hero1.stop();
        //hero1=null;
        javax.swing.JOptionPane.showMessageDialog(frame, "VICTORY!!! CONGRATZ!!");
        level = 1;
        hero1.RIGHTpressed=false;
        //hero.RIGHTpressed=false;
        lvl2setup();
        hero1=null;
      }
    }
  }
}


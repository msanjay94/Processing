class Hero {
  float heroX, heroY, startX, startY;
  float heroSpeed;
  Boolean UPpressed;
  Boolean DOWNpressed;
  Boolean RIGHTpressed;
  Boolean LEFTpressed;
  Boolean victory;
  Hero(float x, float y, float speed) {
    heroX=x;
    heroY=y;
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
    check();
    victory();
  }
  void display() {
    stroke(0);
    fill(255, 0, 0);
    if ( heroX < 33 ) {
      heroX=33;
    }
    if ( heroX >= 567) {
      heroX=567;
    }
    if (heroY < 33) {
      heroY=33;
    }
    if (heroY >= 167) {
      heroY=167;
    }
    rect(heroX, heroY, 16, 16);
  }
  void move() {
    if (UPpressed) {
      heroY-=heroSpeed;
    }
    if (DOWNpressed) {
      heroY+=heroSpeed;
    }
    if (LEFTpressed) {
      heroX-=heroSpeed;
    }
    if (RIGHTpressed) {
      heroX+=heroSpeed;
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
  void check() {
    for (int i = 0; i< 6; i++) {
      if (heroX >= obs[i].xPos - 15 && heroX <= obs[i].xPos + 15) {
        if (heroY >= obs[i].yPos - 15 && heroY <= obs[i].yPos + 15) {
          //println("HIT");
          heroX=startX;
          heroY=startY;
          Deaths++;
        }
      }
    }
  }
  void victory() {
    if (heroX > 483) {
      for (int i=0; i<6; i++) {
        if (c1[i].isCollected==true) {
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
}


class Ball
{
  float y;
  float speedY;
  float speedX;
  float x;
  Boolean live = true;
  Ball(float x, float y, float speedX, float speedY)
  {
    this.x=x;
    this.y=y;
    this.speedX=speedX;
    this.speedY=speedY;
  }
  void run()
  {
    //println("Ball running");
    if (live) {
      display();
    }
    move();
    bounce();
  }
  void display() {
    ellipse(x, y, 20, 20);
  }
  void move() {
    y = y + speedY;
    x = x + speedX;
    //println(x + "\t" + x);
  }
  void delete() {
    x=0;
    y=0;
    speedX=0;
    speedY=0;
  }
  void increaseSpeed()
  {
    if (live) {
      speedY+=0;
    }
  }
  void bounce() {
    if (y>=height - 19) {
      if (mouseX >= x - 35 && mouseX <= x+35) {
        speedY = -1 * speedY;
        y=y-1;
        score++;
        /*if (speedY < 1 && speedY > -1) {
         y=height-10;
         }*/
      } else {
        if (alive>1) {
          alive--;
          this.live=false;
          delete();
        } else {
          javax.swing.JOptionPane.showMessageDialog(frame, "Game Over!!\nYour Score :"+score+"\nA game by Sanjay");
          System.exit(0);
        }
      }
    }
    if (y<=10) {
      speedY = -1 * speedY;
    }
    if (x<=10) {
      speedX = -1 * speedX;
    }
    if (x>=390) {
      speedX = -1 * speedX;
    }
  }
  void gravity() {
    speedY = speedY + 0;
  }
}


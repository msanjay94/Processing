import javax.swing.*;
import java.awt.*;
JLabel l1 = new JLabel();
float[] x1Pos = { 
  175, 275, 375
};
float[] x2Pos = { 
  225, 325, 425
};
int Deaths=0;
float y1Pos = 100;
float y2Pos = 100;
float upspeed = -0.5;
float downspeed = 0.5;
float xPos;
float const_x_hero = 73;
float const_y_hero = 98;
float heroX, heroY;
float heroSpeed=8;
float counter = 0;
void setup() {
  size(600, 200);
  smooth();
  frameRate(100);
  heroX=const_x_hero;
  heroY=const_y_hero;
  rectMode(CENTER);
}
void draw() {
  //println("Deaths :"+Deaths);
  println(mouseX + " " + mouseY);
  background(229, 227, 227);
  fill(157, 247, 247);
  stroke(157, 247, 247);
  rect(300, 100, 550, 150);
  safespot_left();
  safespot_right();
  obstacle_up();
  obstacle_down();
  my_hero();
  check();
  victory();
  fill(0);
  textSize(15);
  text("Deaths:"+Deaths, 1, 15);
  textSize(10);
  fill(255,0,0);
  text("A game by Sanjay!",500,196);
}
void my_hero() {
  stroke(0);
  fill(247, 27, 119);
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
void obstacle_up() {
  for (int i = 0; i<3; i++) {
    y1Pos = y1Pos + downspeed;
    if ( y1Pos == 168) {
      downspeed = -1 * downspeed;
    }
    if (y1Pos == 32) {
      downspeed = -1 * downspeed;
    }
    stroke(0);
    fill(66, 56, 185);
    ellipse(x1Pos[i], y1Pos, 14, 14);
  }
}
void obstacle_down() {
  for (int i = 0; i<3; i++) {
    y2Pos = y2Pos + upspeed;
    if ( y2Pos == 32) {
      upspeed = -1 * upspeed;
    }
    if (y2Pos == 168) {
      upspeed = -1 * upspeed;
    }
    stroke(0);
    fill(66, 56, 185);
    ellipse(x2Pos[i], y2Pos, 14, 14);
  }
}
void safespot_left() {
  stroke(81, 250, 178);
  fill(81, 250, 178);
  rect(75, 100, 100, 150);
}
void safespot_right() {
  stroke(81, 250, 178);
  fill(81, 250, 178);
  rect(525, 100, 100, 150);
}
void keyPressed() {
  //println(int(keyCode));
  if (int(keyCode) == 37) {
    heroX-=heroSpeed;
  }
  if (int(keyCode) == 38) {
    heroY-=heroSpeed;
  }
  if (int(keyCode) == 39) {
    heroX+=heroSpeed;
  }
  if (int(keyCode) == 40) {
    heroY+=heroSpeed;
  }
}
void check() {
  for (int i = 0; i< 3; i++) {
    if (heroX >= x1Pos[i] - 15 && heroX <= x1Pos[i] + 15) {
      if (heroY >= y1Pos - 15 && heroY <= y1Pos + 15) {
        println("HIT");
        heroX=const_x_hero;
        heroY=const_y_hero;
        Deaths++;
      }
    }
    if (heroX >= x2Pos[i] - 15 && heroX <= x2Pos[i] + 15) {
      if (heroY >= y2Pos - 15 && heroY <= y2Pos + 15) {
        println("HIT");
        heroX=const_x_hero;
        heroY=const_y_hero;
        Deaths++;
      }
    }
  }
}
void victory() {
  if (heroX > 483) {
    println("VICTORY");
    javax.swing.JOptionPane.showMessageDialog(this, "VICTORY!!! CONGRATZ!!");
    System.exit(0);
  }
}


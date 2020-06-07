import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import javax.swing.*; 
import java.awt.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Hardest_Game extends PApplet {



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
float upspeed = -0.5f;
float downspeed = 0.5f;
float xPos;
float const_x_hero = 73;
float const_y_hero = 98;
float heroX, heroY;
float heroSpeed=8;
float counter = 0;
public void setup() {
  size(600, 200);
  smooth();
  frameRate(100);
  heroX=const_x_hero;
  heroY=const_y_hero;
  rectMode(CENTER);
}
public void draw() {
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
public void my_hero() {
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
public void obstacle_up() {
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
public void obstacle_down() {
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
public void safespot_left() {
  stroke(81, 250, 178);
  fill(81, 250, 178);
  rect(75, 100, 100, 150);
}
public void safespot_right() {
  stroke(81, 250, 178);
  fill(81, 250, 178);
  rect(525, 100, 100, 150);
}
public void keyPressed() {
  //println(int(keyCode));
  if (PApplet.parseInt(keyCode) == 37) {
    heroX-=heroSpeed;
  }
  if (PApplet.parseInt(keyCode) == 38) {
    heroY-=heroSpeed;
  }
  if (PApplet.parseInt(keyCode) == 39) {
    heroX+=heroSpeed;
  }
  if (PApplet.parseInt(keyCode) == 40) {
    heroY+=heroSpeed;
  }
}
public void check() {
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
public void victory() {
  if (heroX > 483) {
    println("VICTORY");
    javax.swing.JOptionPane.showMessageDialog(this, "VICTORY!!! CONGRATZ!!");
    System.exit(0);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Hardest_Game" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

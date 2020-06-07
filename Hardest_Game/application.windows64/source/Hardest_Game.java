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



int no_of_collectibles;
int collected;
Obstacle[] obs=new Obstacle[6];
Hero hero = new Hero(73, 98, 1.5f);
Collectibles[] c1;
int Deaths=0;
public void setup() {
  size(600, 200);
  smooth();
  frameRate(100);
  no_of_collectibles = 6;
  collected = 0;
  c1=new Collectibles[no_of_collectibles];
  for (int i=0; i<6; i++) {
    c1[i]= new Collectibles((i+1)*50 + 125, 100, false);
  }
  obs[0]=new Obstacle(175, 100, 2);
  obs[1]=new Obstacle(225, 100, -2);
  obs[2]=new Obstacle(275, 100, 2);
  obs[3]=new Obstacle(325, 100, -2);
  obs[4]=new Obstacle(375, 100, 2);
  obs[5]=new Obstacle(425, 100, -2);
  rectMode(CENTER);
}
public void draw() {
  //println("Collected :"+collected);
  //println("Deaths :"+Deaths);
  //println(mouseX + " " + mouseY);
  background(229, 227, 227);
  fill(157, 247, 247);
  stroke(157, 247, 247);
  rect(300, 100, 550, 150);
  safespot_left();
  safespot_right();
  hero.run();
  for (int i=0; i<6; i++) {
    obs[i].run();
    c1[i].run();
  }
  fill(0);
  textSize(15);
  text("Deaths:"+Deaths, 1, 15);
  textSize(10);
  fill(255, 0, 0);
  text("A game by Sanjay!", 500, 196);
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
  hero.heroKeyPressed();
}
public void keyReleased() {
  hero.heroKeyReleased();
}

class Collectibles {
  float x;
  float y;
  Boolean isCollected;
  Collectibles(float x, float y, Boolean collected) {
    this.x=x;
    this.y=y;
    this.isCollected=collected;
  }
  public void run() {
    collected();
    if (!isCollected) {
      fill(255, 255, 0);
      stroke(0);
      ellipse(x, y, 10, 10);
    }
  }
  public void collected() {
    if (hero.heroX >= x-13 && hero.heroX <= x+13) {
      if (hero.heroY>= y-13 && hero.heroY <= y+13) {
        this.isCollected = true;
      }
    }
  }
}

class Obstacle {
  float xPos;
  float yPos;
  float obsSpeed;
  Obstacle(float x, float y, float speed) {
    xPos = x;
    yPos = y;
    obsSpeed = speed;
  }
  public void run()
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
  public void run() {
    display();
    move();
    check();
    victory();
  }
  public void display() {
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
  public void move() {
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
  public void heroKeyPressed()
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
  public void heroKeyReleased() {
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
  public void check() {
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
  public void victory() {
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Hardest_Game" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

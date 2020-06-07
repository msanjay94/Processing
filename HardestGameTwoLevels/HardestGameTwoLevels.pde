import javax.swing.*;
import java.awt.*;
import toxi.geom.*;
int no_of_collectibles;
int collected;
Obstacle1[] obs1=new Obstacle1[6];
Hero1 hero1 = new Hero1(73, 98, 1.5);
Collectibles1[] c1;
int lvl1Deaths=0;
int level = 0;
Hero hero;
generator g;
boolean notCreated=true;
Collectibles[] c = new Collectibles[13];
Obstacles[] obs = new Obstacles[124];
int Deaths = 0;
boolean obsReady = false;
void setup() {
  if ( level == 0) {
    size(600, 200);
    frame.setResizable(true);
    smooth();
    frameRate(100);
    no_of_collectibles = 6;
    collected = 0;
    c1=new Collectibles1[no_of_collectibles];
    for (int i=0; i<6; i++) {
      c1[i]= new Collectibles1((i+1)*50 + 125, 100, false);
    }
    obs1[0]=new Obstacle1(175, 100, 2);
    obs1[1]=new Obstacle1(225, 100, -2);
    obs1[2]=new Obstacle1(275, 100, 2);
    obs1[3]=new Obstacle1(325, 100, -2);
    obs1[4]=new Obstacle1(375, 100, 2);
    obs1[5]=new Obstacle1(425, 100, -2);
    rectMode(CENTER);
  } else
    lvl2setup();
}
void draw() {
  //println(rightPressed);
  if (level == 0) {
    //println("Collected :"+collected);
    //println("Deaths :"+Deaths);
    println(mouseX + " " + mouseY);
    background(229, 227, 227);
    fill(157, 247, 247);
    stroke(157, 247, 247);
    rect(300, 100, 550, 150);
    safespot_left();
    safespot_right();
    if (hero1!=null)
      hero1.run();
    for (int i=0; i<6; i++) {
      if (hero1!=null)
      {
        obs1[i].run();
        c1[i].run();
      }
    }
    fill(0);
    textSize(15);
    text("Deaths:"+Deaths, 1, 15);
    textSize(10);
    fill(255, 0, 0);
    text("A game by Sanjay, Vishnu!", 500, 196);
  } else
    lvl2draw();
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
  if (level == 0)
    hero1.hero1KeyPressed();
  else if( level == 1)
  {
    //hero1.hero1KeyReleased();
    lvl2keyPressed();
  }
}
void keyReleased() {
  if (level == 0)
    hero1.hero1KeyReleased();
  else
    lvl2keyReleased();
}


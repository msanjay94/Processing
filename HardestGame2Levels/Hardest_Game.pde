import javax.swing.*;
import java.awt.*;
int no_of_collectibles;
int collected;
Obstacle1[] obs=new Obstacle1[6];
Hero1 hero1 = new Hero1(73, 98, 1.5);
Collectibles1[] c1;
int Deaths=0;
void setup() {
  size(600, 200);
  smooth();
  frameRate(100);
  no_of_collectibles = 6;
  collected = 0;
  c1=new Collectibles1[no_of_collectibles];
  for (int i=0; i<6; i++) {
    c1[i]= new Collectibles1((i+1)*50 + 125, 100, false);
  }
  obs[0]=new Obstacle1(175, 100, 2);
  obs[1]=new Obstacle1(225, 100, -2);
  obs[2]=new Obstacle1(275, 100, 2);
  obs[3]=new Obstacle1(325, 100, -2);
  obs[4]=new Obstacle1(375, 100, 2);
  obs[5]=new Obstacle1(425, 100, -2);
  rectMode(CENTER);
}
void draw() {
  //println("Collected :"+collected);
  //println("Deaths :"+Deaths);
  println(mouseX + " " + mouseY);
  background(229, 227, 227);
  fill(157, 247, 247);
  stroke(157, 247, 247);
  rect(300, 100, 550, 150);
  safespot_left();
  safespot_right();
  hero1.run();
  for (int i=0; i<6; i++) {
    obs[i].run();
    c1[i].run();
  }
  fill(0);
  textSize(15);
  text("Deaths:"+Deaths, 1, 15);
  textSize(10);
  fill(255, 0, 0);
  text("A game by Sanjay, Vishnu!", 500, 196);
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
  hero1.hero1KeyPressed();
}
void keyReleased() {
  hero1.hero1KeyReleased();
}


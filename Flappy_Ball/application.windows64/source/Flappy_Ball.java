import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import toxi.geom.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Flappy_Ball extends PApplet {


int i=0, score=0;
int lastPillar=0;
int pillars, hitPillar=0;
Boolean hitPillarChange=true;
Pillar temp1, temp2, temp3, temp4, hit;
Ball heroBall;
//Ball currentBall, hitBall, lastBall, newBall;
ArrayList pillarColl=new ArrayList();
PFont f1;
public void setup() {
  size(320, 480);
  smooth();
  f1=createFont("Bitstream Charter Bold", 15);
  fill(255, 0, 0);
  textFont(f1);
  textSize(20);
  //text("Score:"+(score/30), width/2-40, 20);
  Pillar b=new Pillar(new Vec3D(width+50, 0, 0), new Vec3D(-1, 0, 0), 45, random(35, 320));
  pillarColl.add(b);
  heroBall=new Ball(new Vec3D(40, 0, 0), new Vec3D(0, 1, 0), 10, 0.3f);
}
public void draw() {
  background(0);
  frameRate(60);
  heroBall.run();
  //heroBall.update();
  hit=(Pillar)pillarColl.get(hitPillar);
  heroBall.check(hit);
  for (pillars=lastPillar; pillars<=i; pillars++) {
    temp1=(Pillar)pillarColl.get(pillars);
    temp1.run();
  }
  if (temp1.loc.x<=width-90) {
    createPillar();
  }
  temp2=(Pillar)pillarColl.get(lastPillar);
  if (temp2.loc.x<=-18) {
    hitPillar=lastPillar+1;
    hitPillarChange=true;
  }
  if (temp2.loc.x<=-45) {
    killPillar();
  }
  println("Balls created="+(i+1)+"\tBalls killed="+(lastPillar+1)+"\tHitball="+(hitPillar+1)+"\tScore:"+score);
  fill(255, 0, 0);
  textFont(f1);
  textSize(20);
  text("Score:"+(score/68), width/2-40, 20);
}
public void createPillar() {
  Pillar b=new Pillar(new Vec3D(width+50, 0, 0), new Vec3D(-1, 0, 0), 45, random(35, 320));
  pillarColl.add(b);
  i++;
}
public void killPillar() {
  temp4=(Pillar)pillarColl.get(lastPillar);
  temp4.alive=false;
  lastPillar++;
}
public void mousePressed() {
  heroBall.jump();
}

class Pillar {
  Vec3D loc, speed;
  float rectWidth;
  float rectHeight;
  Boolean alive;
  Pillar(Vec3D loc, Vec3D speed, float rectWidth, float rectHeight) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    this.rectWidth=rectWidth;
    this.rectHeight=rectHeight;
    alive=true;
  }
  public void run()
  {
    display();
    move();
  }
  public void display() {
    if (alive) {
      fill(255);
      stroke(255);
      rect(loc.x, loc.y, rectWidth, rectHeight);
      rect(loc.x, loc.y+rectHeight+150, rectWidth, height);
    } else {
      loc.x=-1;
      loc.y=-1;
      speed.x=0;
      speed.y=0;
    }
  }
  public void update() {
    loc.y=mouseY;
  }
  public void move() {
    loc.addSelf(speed);
  }
  
}

class Ball
{
  Vec3D loc, speed;
  float radius;
  float gravity;
  Ball(Vec3D loc, Vec3D speed, float radius, float gravity) {
    this.loc=loc.copy();
    this.speed=speed.copy();
    this.radius=radius;
    this.gravity=gravity;
  }
  public void run() {
    display();
    gravity();
    checkBoundary();
  }
  public void display() {
    loc.addSelf(speed);
    fill(255);
    stroke(255);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  public void gravity(){
    speed.y+=gravity;
    speed.limit(5);
  }
  public void jump(){
    if(loc.y>=radius+5){
      speed.y=-20;
    }
  }
  public void checkBoundary()
  {
    if (loc.y<=0) {
      loc.y=radius;
      speed.y=0;
    }
    if (loc.y>=height-radius) {
      javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore : "+score/68+"\nA game by Sanjay");
      System.exit(0);
    }
  }
  public void update() {
    loc.y=mouseY;
  }
  public void check(Pillar p) {
    if (this.loc.x>=(p.loc.x-this.radius) && this.loc.x<=(p.loc.x+this.radius+this.radius+p.rectWidth)) {
      if (this.loc.y>=(p.loc.y-this.radius) && this.loc.y<=(p.loc.y+p.rectHeight+this.radius )) {
        javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore:"+score/68+"\nA game by Sanjay");
        System.exit(0);
      } else if (this.loc.y>=p.loc.y-this.radius+p.rectHeight+150) {
        javax.swing.JOptionPane.showMessageDialog(frame, "You lose\nScore : "+score/68+"\nA game by Sanjay");
        System.exit(0);
      } else {
        if (hitPillarChange=true) {
          score++;
          hitPillarChange=false;
        }
      }
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Flappy_Ball" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

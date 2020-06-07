import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Bounce extends PApplet {

int alive,score;
Ball b1,b2,b3,b4,b5;
public void setup() {
  size(400, 600);
  smooth();
  rectMode(CENTER);
  b1=new Ball(55, 55, 1, 2.2f);
  b2 = new Ball(113, 134, -1.5f, 3.5f);
  b4=new Ball(286, 150, -1, 4.0f);
  b5=new Ball(368, 16, 1, 3.2f);
  b3=new Ball(197, 40, 1, 2.7f);
  alive=5;
  score=0;
}
public void draw() {
  println(alive);
  background(0);
  fill(255);
  stroke(255);
  b1.run();
  b2.run();
  b3.run();
  b4.run();
  b5.run();
  //println(y + "\t" + speed + "\t" + (y+speed));
  rect(mouseX, height-6, 50, 6);
  textSize(26);
  fill(209,38,38);
  text("Score :"+score,290,30);
}

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
  public void run()
  {
    //println("Ball running");
    if (live) {
      display();
    }
    move();
    bounce();
  }
  public void display() {
    ellipse(x, y, 20, 20);
  }
  public void move() {
    y = y + speedY;
    x = x + speedX;
    //println(x + "\t" + x);
  }
  public void delete() {
    x=0;
    y=0;
    speedX=0;
    speedY=0;
  }
  public void bounce() {
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
  public void gravity() {
    speedY = speedY + 0;
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Bounce" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

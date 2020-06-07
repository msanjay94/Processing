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

public class first_app extends PApplet {

public void setup() {
  size(640, 700);
  //background(0);
  smooth();
}

public void draw() {
  float x = mouseX;
  float y = mouseY;
  background(255);
  leftRect();
  rightRect();
  if (x <=21 ) {
    x=21;
  }
  if (x>=619) {
    x=619;
  }
  if (y<=21) {
    y=21;
  }
  if (y>=689) {
    y=679;
  }
  if ( x < 320 ) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(x, y, 40, 40);
  } else {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(x, y, 40, 40);
  }
  stroke(255);
  fill(255);
  rect(315, 0, 10, 960);
}

public void leftRect() {
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(0, 0, 315, 700);
}

public void rightRect() {
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(325, 0, 400, 700);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "first_app" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

import toxi.geom.*;
import javax.swing.*;
import java.awt.*;
import java.text.*;
import java.awt.event.*;
import java.io.*;
speed myball;
angle myangle=new angle();
Vec3D moving, stand, sub;
Ball temp, evil;
int enumhero=-1, enumevil=1;
int turn;
Float gspeed=0.0;
JLabel speedLabel;
JTextField speedText;
JButton setSpeed, speedmeter, anglemeter;
Panel p;
Boolean ballCreated=false, evilCreated=false;
ArrayList ballColl=new ArrayList();
ArrayList path = new ArrayList();
void makeUI() {
  p=new Panel();
  setLayout(null);
  speedLabel = new JLabel();
  speedLabel.setForeground(new Color(240, 240, 240));
  speedText = new JFormattedTextField(NumberFormat.getNumberInstance());
  speedText.setColumns(3);
  setSpeed = new JButton("Set");
  speedmeter = new JButton("Speed");
  anglemeter = new JButton("Angle");
  setSpeed.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent ae) {
      gspeed=Float.parseFloat(speedText.getText());
      //speedLabel.setText(speedText.getText());
    }
  }
  );
  speedmeter.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent ae) {
      myball.startMeter();
    }
  }
  );
  anglemeter.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent ae) {
      myangle.startMeter();
    }
  }
  );
  p.setBounds(0, 0, 400, 50);
  p.setBackground(new Color(32, 32, 32));
  p.add(speedLabel);
  p.add(speedText);
  p.add(setSpeed);
  p.add(anglemeter);
  p.add(speedmeter);
  add(p);
}


void setup()
{
  size(400, 400);
  myball=new speed(float(width-(width/20)), float(height-(height/20)));
  smooth();
  moving = new Vec3D(0, 0, 0);
  stand = new Vec3D(215, height-12, 0);
  makeUI();
  turn=enumhero;
}
void draw()
{
  //println(mouseX + "\t" + mouseY);
  //strokeWeight(10);
  println(turn);
  speedLabel.setText("Speed : "+gspeed);
  background(0);
  //translate(width/2, height/2);
  stroke(255);
  fill(255);
  strokeWeight(1);
  //line(0, -height/2, 0, height/2);
  //line(-width/2, 0, width/2, 0);
  stroke(255, 0, 0);
  strokeWeight(5);
  point(stand.x, stand.y);
  stroke(0, 255, 0);
  moving.x=mouseX;
  moving.y=mouseY;
  point(moving.x, moving.y);
  //sub=moving.sub(stand);
  //sub=myangle.output.copy();
  //sub.normalizeTo(gspeed);
  stroke(0, 0, 255);
  //line(0, 0, sub.x, sub.y);
  for (int i=0; i<ballColl.size (); i++) {
    temp=(Ball)ballColl.get(i);
    temp.run();
  }
  //temp.run();
  myball.run();
  myangle.call();
  stroke(0, 0, 255);
  line(73, 82, 73, height);
  line(73, 82, 354, 82);
  line(354, 82, 354, height);
  if (!ballCreated)
    createBall();
  if (!evilCreated)
    createEvil();
  else
    evil.runEvil();
  if (turn==enumevil) {
    evil.randomize();
    if (!evil.moving)
      evil.startBall(evil.random);
  }
  //println(path.size());
}
void createBall() {
  ballCreated=true;
  temp=new Ball(new Vec3D(stand.x, stand.y, 0), new Vec3D(0, 0, 0));
  ballColl.add(temp);
  path.add(stand);
}
void createEvil() {
  evilCreated=true;
  evil=new Ball(new Vec3D(width/2, 92, 0), new Vec3D(0, 0, 0));
  evil.setColor(255, 0, 0);
}
void mousePressed() {
  if (turn==enumhero)
    heroConditions();
}
void heroConditions() {
  if (mouseY>82) {
    if (mouseX<73) {
      if (!myangle.stopped)
        myangle.stopMeter();
      else
        myangle.startMeter();
    } else if (mouseX>355) {
      if (!myball.stopped)
        myball.stopMeter();
      else
        myball.startMeter();
    } else {
      if ((!ballCreated)&&(turn==enumhero)) {
        temp=new Ball(new Vec3D(stand.x, stand.y, 0), new Vec3D(sub.x, sub.y, 0));
        ballColl.add(temp);
        ballCreated=true;
      } else {
        if ((!temp.moving)&&(turn==enumhero)) {
          sub=myangle.output.copy();
          temp.startBall(sub.normalizeTo(myball.output));
        }
      }
    }
  }
}


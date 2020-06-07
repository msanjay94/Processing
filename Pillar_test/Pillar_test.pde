  float rectWidthByTwo=22;
  float upperCenterX=width/2;//-rectWidthByTwo;
  float upperCenterY=0;
  float upperWidth=45;
  float upperHeight=random(35,320);
void setup(){
  size(320,480);
  smooth();
  //rectMode(CENTER);
  //rect(0,0,50,50);
}
void draw(){
  print(width+"\n");
  //print(width);
  background(0);
  stroke(255);
  fill(255);
  
  rect(upperCenterX,upperCenterY,upperWidth,upperHeight);
  rect(upperCenterX,upperCenterY+upperHeight+150,upperWidth,height);
  //print(mouseX+"\t"+mouseY+"\n");
}
void mousePressed(){
  recalculate();
}
void recalculate(){
  rectWidthByTwo=22;
  upperCenterX=width/2;//-rectWidthByTwo;
  upperCenterY=0;
  upperWidth=45;
  upperHeight=random(35,320);
}

int alive,score;
Ball[] b=new Ball[5];
float time;
Boolean increasedTimer=false;
void setup() {
  size(400, 600);
  smooth();
  rectMode(CENTER);
  b[0]=new Ball(55, 55, 1, 2.2);
  b[1] = new Ball(113, 134, -1.5, 3.5);
  b[2]=new Ball(197, 40, 1, 2.7);
  b[3]=new Ball(286, 150, -1, 4.0);
  b[4]=new Ball(368, 16, 1, 3.2);
  alive=5;
  score=0;
}
void draw() {
  time=millis();
  println(time);
  background(0);
  fill(255);
  stroke(255);
  b[0].run();
  b[1].run();
  b[2].run();
  b[3].run();
  b[4].run();
  //println(y + "\t" + speed + "\t" + (y+speed));
  rect(mouseX, height-6, 50, 6);
  textSize(26);
  fill(209,38,38);
  text("Score :"+score,290,30);
  if(time>10000){
    if(!increasedTimer)
    for(int i=0;i<5;i++){
      b[i].increaseSpeed();
      increasedTimer=true;
    }
  }
}


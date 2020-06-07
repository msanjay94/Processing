int alive,score;
Ball b1,b2,b3,b4,b5;
void setup() {
  size(400, 600);
  smooth();
  rectMode(CENTER);
  b1=new Ball(55, 55, 1, 2.2);
  b2 = new Ball(113, 134, -1.5, 3.5);
  b4=new Ball(286, 150, -1, 4.0);
  b5=new Ball(368, 16, 1, 3.2);
  b3=new Ball(197, 40, 1, 2.7);
  alive=5;
  score=0;
}
void draw() {
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


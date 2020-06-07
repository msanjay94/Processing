float posspeedx=0;
float negspeedx=0;
float speedx=0;
float posspeedy=0.2;
float negspeedy=-0.2;
float speedy1=0.2;
float speedy2=0.4;
float x1=-40;
float x2=80;
float y1=-30;
float y2=10;
void setup()
{
  size(400, 400);
  smooth();
  
}
void draw()
{
  background(127);
  translate(200, 200);
  stroke(0);
  strokeWeight(1);
  line(0,-200,0,200);
  line(200,0,-200,0);
  point(0,0);
  move();
  bounce();
  call(x1,y1, x2,y2 );
}
void bounce(){
  if(y1<=-50){
    speedy1*=-1;
  }
  if(y1>=50){
    speedy1*=-1; 
  }
  if(y2<=-80){
    speedy2*=-1;
  }
  if(y2>=80){
    speedy2*=-1; 
  }
}
void move(){
  x1+=speedx;
  y1+=speedy1;
  x2+=speedx;
  y2-=speedy2;
}
void call(float x3, float y3, float x4, float y4) {
  println(x3 +":"+y3+" "+x4 +":"+y4+" "+(x3-x4) +":"+(y3-y4)+" "+(x4-x3) +":"+(y4-y3));
  stroke(255, 0, 0);
  strokeWeight(5);
  point(x3, y3);
  stroke(0, 255, 0);
  point(x4, y4);
  stroke(0, 0, 255);
  point(x3-x4, y3-y4);
  stroke(255);
  point(x4-x3,y4-y3);
}


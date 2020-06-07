class ball
{
  PFont f = createFont("Arial",16,true);
  float a=0,b=0;
  float x=0;
  float y=0;
  float speed=height/100;
  ball(float a,float b)
  {
    x=a;
    y=b;
  }
  void display()
  {
    line(width*9/10,height,width*9/10,height*6/10);
    for(int i=0;i<(50);i=i+2)
    {
      line(width*9/10,(height*6/10)+i,width,(height*6/10)+i);
      stroke(255,0,0);
    }
    for(int i=50;i<300;i=i+2)
    {
      line(width*9/10,(height*6/10)+i,width,(height*6/10)+i);
      stroke(255,255,0);
    }
    //stroke(0,0,255);
    ellipse(x,y,width*1/10,height/120); 
    fill(0);
  }
  void move()
  {
    y=y+speed;
  }
  void stopMeter(){
    a=y;  
      speed=0;
  }
  void bounce()
  {

    if(y>height)
    {
      speed*=-1;  
    }    
    if(y<((height*6/10)+5))
    {
      speed*=-1;  
    }    
  }
  void speed()
  {
    b=height-a;
    //ellipse(100,b,10,10);
  }
  void change()
  {
  x=width-(width/20);
  y=height-(height/20);
  old_width=width;
  old_height=height;
  }
  void dispspeed()
  {
  textFont(f,16);
  fill(255);                        
  text("Speed  "+b,300,20);
  
  }
  void run()
  {
  //init();
    display();
    move();
    bounce();
    speed();
    dispspeed(); 
    
  }
}

class speed
{
  PFont f = createFont("Arial",16,true);
  float a=0,b=0;
  float x=0;
  float y=0;
  float output=0;
  float speed=height/100;
  Boolean display=false, stopped=false;;
  speed(float a,float b)
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
    stroke(0,0,255);
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
      display=true;
      stopped=true;
  }
  void startMeter(){
    display=false;
    stopped=false;
    speed=4;
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
  
  void dispspeed()
  {
    if(display){
      output=parseFloat(String.format("%.2f",b/152));
      gspeed=output;
  textFont(f,16);
  fill(255);                        
  text("Speed  "+output,300,70);
    }
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

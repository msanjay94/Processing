float old_width;
float old_height;
ball myball;//=new ball();
angle myangle=new angle();
void setup()
{
  size(400,400);
  if (frame != null) 
  {
    //frame.setResizable(true);
  }
  smooth();
  myball=new ball(float(width-(width/20)),float(height-(height/20)));
  old_width=width;
  old_height=height;
  //reset();
}
void draw()
{
  //if(old_width!=width||old_height!=height)
  //{
  //  myball.change();
  //}
  background(0,0,0);
  myball.run();
  myangle.call();
  //reset();
}
void reset()
{
  if(mousePressed&&(mouseX<=((width/2)-width/2.5))&&(mouseX<=((width/2)+width/2.5)))
  {
    if((mouseX<=((height/10*9)))&&(mouseX<=((height))))
    {
      setup();
    }
  }
}
void mousePressed(){
if(mouseX<150){
  myangle.stopMeter();
}
else{
  myball.stopMeter();
}
}



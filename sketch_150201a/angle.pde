class angle
{
  PFont f = createFont("Arial",16,true);
  float cx, cy;
  float a,b;
  float Radius;
  float Diameter;
  float s=0.0;
  float ds=0.3;
  void init()
  {
    Diameter=((width+height)/2)/6;
    Radius =Diameter/2; 
    cx = Radius+2;
    cy = height-cx;
  }
  void disp()
  {
    fill(200);
    noStroke();
    ellipse(cx, cy, Diameter, Diameter);
    stroke(255);
    strokeWeight(1);
    stroke(255,0,0);
    line(cx, cy, (cx + cos(s) * Radius), (cy + sin(s) * Radius));
    s+=ds;
  }
  void stopMeter(){
    a=(cx + cos(s) * Radius);
      b=(cy + cos(s) * Radius);
      //line(cx,cy,a,b);
      ds=0;
      //s=0;
  }
  void dispangle()
  {
    textFont(f,16);
    fill(255);                        
    text("Angle  "+(a-cx)+" , "+(b-cy),20,20);
  }
  void call()
  {
    init();
    disp();
    dispangle();
  }
}



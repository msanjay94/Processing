class angle
{
  PFont f = createFont("Arial", 16, true);
  float cx, cy;
  float a, b;
  float Radius;
  float Diameter;
  float s=0.0;
  float ds=0.3;
  Vec3D output = new Vec3D(0, 0, 0);
  Boolean display=false, stopped=false;;
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
    stroke(255, 0, 0);
    line(cx, cy, (cx + cos(s) * Radius), (cy + sin(s) * Radius));
    s+=ds;
  }
  void stopMeter() {
    ds=0;
    a=(cx + cos(s) * Radius)-cx;
    b=(cy + sin(s) * Radius)-cy;
    //line(cx,cy,a,b);
    
    //s=0;
    display=true;
    stopped=true;
  }
  void startMeter() {
    ds=0.3;
    display=false;
    stopped=false;
  }
  void dispangle()
  {
    if (display) {
      textFont(f, 16);
      fill(255);  
      output.x=parseFloat(String.format("%.2f", a));
      output.y=parseFloat(String.format("%.2f", b));      
      text("Angle  "+output.x+" , "+output.y, 20, 70);
    }
  }
  void call()
  {
    init();
    disp();
    dispangle();
  }
}


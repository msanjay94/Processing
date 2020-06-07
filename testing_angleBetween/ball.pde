class ball{
Vec3D pos;
Vec3D speed;
float radius;
ball(){
pos=new Vec3D(random(30,width),random(30,height),0);
speed=new Vec3D(1,1,0);
radius=10;
}
void run(){
display();
move();
bounce();
}
void display(){
  stroke(255);
  fill(255);
  ellipse(pos.x,pos.y,radius,radius);
}
void move(){
pos.addSelf(speed);
}
void bounce(){
if(pos.x<10 || pos.x>width-10)
speed.x*=-1;
if(pos.y<10 || pos.y>height-10)
speed.y*=-1;
}
}

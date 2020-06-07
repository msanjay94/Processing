void basicboard(){
fill(#4A9856);
stroke(0,100,100);
rect(width/2,height/2,width-40,height-40);
fill(#066415);
stroke(10);
quad(34,20,width/2-12,20,width/2-15,26,42,26);
quad(width/2+12,20,width-34,20,width-42,26,width/2+15,26);
quad(34,height-20,width/2-12,height-20,width/2-15,height-26,42,height-26);
quad(width/2+12,height-20,width-34,height-20,width-42,height-26,width/2+15,height-26);
quad(20,34,26,42,26,height-42,20,height-34);
quad(width-20,34,width-26,42,width-26,height-42,width-20,height-34);
stroke(255);
strokeWeight(1.5);
noFill();
arc(width/4, height/2, width/4, 2*height/4,HALF_PI,3*PI/2);
line(width/4,26,width/4,height-26);
strokeWeight(2);
stroke(0);
point(width/4,height/2);
h1=new hole(new Vec3D(23,23,0));
h2=new hole(new Vec3D(width/2,20,0));
h3=new hole(new Vec3D(width-23,23,0));
h4=new hole(new Vec3D(23,height-23,0));
h5=new hole(new Vec3D(width/2,height-20,0));
h6=new hole(new Vec3D(width-23,height-23,0));
}
class hole{
Vec3D pos;
float radius;
hole(Vec3D pos){
this.pos=pos;
radius=23;
fill(0);
stroke(100);
ellipse(pos.x,pos.y,radius,radius);
}
}

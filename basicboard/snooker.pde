import toxi.geom.*;
hole h1,h2,h3,h4,h5,h6;
cue c=new cue();
void setup(){
size(600,300);
smooth();
rectMode(CENTER);
}
void draw(){
background(242,100,20);
basicboard();
println(mouseX+"\t"+mouseY);
fill(255);
 //ellipse(mouseX,mouseY,18,18);
c.cueball();

}

class Point{
  Vec3D loc;
  Point(Vec3D _loc){
    loc=_loc;
  }
  void run(){
    display();
  }
  void display(){
    strokeWeight(2);
    stroke(255,0,0);
    point(loc.x,loc.y,loc.z);
  }
}

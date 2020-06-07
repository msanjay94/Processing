class CA {
  Vec3D loc;
  int x, y;
  int type;
  int futurType;
  CA(Vec3D loc, int x, int y) {
    this.loc = loc;
    this.x=x;
    this.y=y;
    type=0;
  }
  void updateType() {
    type=futurType;
  }
  void run() {
    display();
    evalN();
  }
  void evalN() {
    int count=0;
    if (grid[(x+rows-1)%rows][(y+cols-1)%cols].type==1)count ++;
    if (grid[(x+rows-1)%rows][(y+cols)%cols].type==1)count ++;
    if (grid[(x+rows-1)%rows][(y+cols+1)%cols].type==1)count ++;
    if (grid[(x+rows)%rows][(y+cols-1)%cols].type==1)count ++;
    if (grid[(x+rows)%rows][(y+cols+1)%cols].type==1)count ++;
    if (grid[(x+rows+1)%rows][(y+cols-1)%cols].type==1)count ++;
    if (grid[(x+rows+1)%rows][(y+cols)%cols].type==1)count ++;
    if (grid[(x+rows+1)%rows][(y+cols+1)%cols].type==1)count ++;

    if (type==1 && count<2)
      futurType=0;
    if (type==1 && (count>=2 && count <=3))
      futurType=1;
    if (type==1 && count>3)
      futurType=0;
    if (type==0 && count==3)
      futurType=1;
  }
  void display() {
    if (type == 1) {
      stroke(255);
      strokeWeight(3);
      point(loc.x, loc.y);
    }
  }
}


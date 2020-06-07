void basicUI() {
  //Overall grey rectangle
  background(229, 227, 227);
  //cyan inner background
  fill(157, 247, 247);
  stroke(157, 247, 247);
  rectToCenter(50, 50, width-100, height-100);
  //upper middle status bar
  fill(229, 227, 227);
  stroke(229, 227, 227);
  rectToCenter(100, 50, width-200, 50);
  //top left green
  stroke(81, 250, 178);
  fill(81, 250, 178);
  rectToCenter(50, 50, 100, 50);
  //top right green
  rectToCenter(width-150, 50, 100, 50);
  textSize(10);
  fill(255,0,0);
  text("A game by Sanjay, Vishnu!",1050,440);
  strokeWeight(2);
  stroke(0);
  line(50,50,50,height-50);
  line(50,height-50,width-50,height-50);
  line(width-50,height-50,width-50,50);
  line(50,50,150,50);
  line(150,50,150,100);
  line(150,100,width-150,100);
  line(width-150,100,width-150,50);
  line(width-150,50,width-50,50);
}
void rectToCenter(int x, int y, int a, int b){
rect((2*x+a)/2,(2*y+b)/2,a,b);
}

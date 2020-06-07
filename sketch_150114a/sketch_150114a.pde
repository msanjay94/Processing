import javax.swing.JButton;
import javax.swing.UIManager;
import java.awt.*;

int dx = 300, dy = 200;

void setup() {
  size(640,480);
  
  makeUI();
  
  frameRate(30);
}

void mouseDragged() {
  dx += mouseX - pmouseX;
  dy += mouseY - pmouseY;
}

void draw() {
  background(0);
  
  rect(dx,dy,20,20);
  
}

void makeUI() {
  /*
  try {
    //Attempt to use the system look and feel
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    
  } catch (Exception er) {
    //we're stuck with the default look and feel
    println("Unable to load SystemLookAndFeel");
  }*/
  
  
  setLayout(null);//lets us specify where to put objects
  
  
  Panel p = new Panel();
  p.setBounds(0,0,width,50);
  p.setBackground(new Color(0,255,0));
  
  
  JButton jb = new JButton("Green");
  jb.addMouseListener(new java.awt.event.MouseAdapter() {
    public void mouseClicked(java.awt.event.MouseEvent evt) {//button code
  fill(0,255,0);
    }
  });
  
  
  JButton jbr = new JButton("Red");
  jbr.addMouseListener(new java.awt.event.MouseAdapter() {
    public void mouseClicked(java.awt.event.MouseEvent evt) {//button code
  fill(255,0,0);
    }
  });
  
  
  p.add(jb);
  p.add(jbr);
  
  add(p);
}

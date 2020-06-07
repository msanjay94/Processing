import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
class numbergame extends JFrame implements ActionListener
{
JButton n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n0,help,reset;
JButton n[]={n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n0};
JTextField t1;
JLabel l1;
JPanel p1,p2,p3;
JMenuBar menu;
JMenu file;
JMenuItem Exit;
JMenuItem SaveGame;
JMenuItem LoadGame;
BufferedReader br;
BufferedWriter bw;
File tempfile;
int count;
int nullPointer;
public void set()
{
n[0].setText("14");
n[1].setText("5");
n[2].setText("9");
n[3].setText("2");
n[4].setText("11");
n[5].setText("4");
n[6].setText("15");
n[7].setText("1");
n[8].setText("8");
n[9].setText("3");
n[10].setText("");
n[11].setText("12");
n[12].setText("6");
n[13].setText("13");
n[14].setText("7");
n[15].setText("10");
count=0;
nullPointer=10;
}
numbergame()
{
menu=new JMenuBar();
//menu.setBackground("GRAY");
file=new JMenu("File");
menu.add(file);
Exit=new JMenuItem("Exit");
Exit.addActionListener(this);
SaveGame=new JMenuItem("Save");
SaveGame.addActionListener(this);
LoadGame=new JMenuItem("Load");
LoadGame.addActionListener(this);
file.add(SaveGame);
file.add(LoadGame);
file.add(Exit);
setTitle("Numbers");
setResizable(false);
p1=new JPanel();
p2=new JPanel();
p3=new JPanel();
p1.setSize(150,150);
p2.setSize(150,80);
p3.setSize(150,10);
help=new JButton("Help");
help.addActionListener(this);
count=0;
l1=new JLabel("Moves:0");
reset=new JButton("Reset");
reset.addActionListener(this);
setJMenuBar(menu);
add(p1,BorderLayout.NORTH);
add(p2,BorderLayout.CENTER);
add(p3,BorderLayout.SOUTH);
t1=new JTextField(10);
p2.setLayout(new FlowLayout());
p2.add(reset);
p2.add(help);
p3.add(l1,BorderLayout.CENTER);
n[0]=new JButton("");
n[0].addActionListener(this);
n[1]=new JButton("");
n[1].addActionListener(this);
n[2]=new JButton("");
n[2].addActionListener(this);
n[3]=new JButton("");
n[3].addActionListener(this);
n[4]=new JButton("");
n[4].addActionListener(this);
n[5]=new JButton("");
n[5].addActionListener(this);
n[6]=new JButton("");
n[6].addActionListener(this);
n[7]=new JButton("");
n[7].addActionListener(this);
n[8]=new JButton("");
n[8].addActionListener(this);
n[9]=new JButton("");
n[9].addActionListener(this);
n[10]=new JButton("");
n[10].addActionListener(this);
n[11]=new JButton("");
n[11].addActionListener(this);
n[12]=new JButton("");
n[12].addActionListener(this);
n[13]=new JButton("");
n[13].addActionListener(this);
n[14]=new JButton("");
n[14].addActionListener(this);
n[15]=new JButton("");
n[15].addActionListener(this);
p1.add(n[0]);
p1.add(n[1]);
p1.add(n[2]);
p1.add(n[3]);
p1.add(n[4]);
p1.add(n[5]);
p1.add(n[6]);
p1.add(n[7]);
p1.add(n[8]);
p1.add(n[9]);
p1.add(n[10]);
p1.add(n[11]);
p1.add(n[12]);
p1.add(n[13]);
p1.add(n[14]);
p1.add(n[15]);
Load("default");
p1.setLayout(new GridLayout(4,4));
setVisible(true);
setSize(150,260);
setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
}
public void Load(String filename)
{
try
{
br=new BufferedReader(new FileReader(filename+".ng"));
for(int i=0;i<16;i++)
{
n[i].setText(br.readLine());
}
count=Integer.parseInt(br.readLine());
nullPointer=Integer.parseInt(br.readLine());
n[nullPointer].setText("");
//JOptionPane.showMessageDialog(this,"Game loaded");
}
catch(Exception e)
{
//JOptionPane.showMessageDialog(this,"File read error","Error",JOptionPane.INFORMATION_MESSAGE);
set();
}
}
public boolean victory()
{
if(n[0].getText().startsWith("1"))
if(n[1].getText().startsWith("2"))
if(n[2].getText().startsWith("3"))
if(n[3].getText().startsWith("4"))
if(n[4].getText().startsWith("5"))
if(n[5].getText().startsWith("6"))
if(n[6].getText().startsWith("7"))
if(n[7].getText().startsWith("8"))
if(n[8].getText().startsWith("9"))
if(n[9].getText().startsWith("10"))
if(n[10].getText().startsWith("11"))
if(n[11].getText().startsWith("12"))
if(n[12].getText().startsWith("13"))
if(n[13].getText().startsWith("14"))
if(n[14].getText().startsWith("15"))
return true;
return false;
}
public void win()
{
if(victory())
{
JOptionPane.showMessageDialog(this,"YOU WIN ! ! ! :D");
dispose();
}
}
public void swap(int x, int y)
{
n[y].setText(n[x].getText());
n[x].setText("");
nullPointer=x;
count++;
}
public void actionPerformed(ActionEvent ae)
{
try
{
if(ae.getSource()==n[0])
{
if(n[0].getText()!="")
{
if((nullPointer==1)|(nullPointer==4))
{
swap(0,nullPointer);
}
}
}
if(ae.getSource()==n[1])
{
if(n[1].getText()!="")
{
if((nullPointer==2)|(nullPointer==5)|(nullPointer==0))
{
swap(1,nullPointer);
}
}
}
if(ae.getSource()==n[2])
{
if(n[2].getText()!="")
{
if((nullPointer==1)|(nullPointer==3)|(nullPointer==6))
{
swap(2,nullPointer);
}
}
}
if(ae.getSource()==n[3])
{
if(n[3].getText()!="")
{
if((nullPointer==2)|(nullPointer==7))
{
swap(3,nullPointer);
}
}
}
if(ae.getSource()==n[4])
{
if(n[4].getText()!="")
{
if((nullPointer==0)|(nullPointer==5)||(nullPointer==8))
{
swap(4,nullPointer);
}
}
}
if(ae.getSource()==n[5])
{
if(n[5].getText()!="")
{
if((nullPointer==1)|(nullPointer==4)|(nullPointer==6)|(nullPointer==9))
{
swap(5,nullPointer);
}
}
}
if(ae.getSource()==n[6])
{
if(n[6].getText()!="")
{
if((nullPointer==2)|(nullPointer==5)|(nullPointer==7)|(nullPointer==10))
{
swap(6,nullPointer);
}
}
}
if(ae.getSource()==n[7])
{
if(n[7].getText()!="")
{
if((nullPointer==3)|(nullPointer==6)|(nullPointer==11))
{
swap(7,nullPointer);
}
}
}
if(ae.getSource()==n[8])
{
if(n[8].getText()!="")
{
if((nullPointer==4)|(nullPointer==9)|(nullPointer==12))
{
swap(8,nullPointer);
}
}
}
if(ae.getSource()==n[9])
{
if(n[9].getText()!="")
{
if((nullPointer==5)|(nullPointer==8)|(nullPointer==10)|(nullPointer==13))
{
swap(9,nullPointer);
}
}
}
if(ae.getSource()==n[10])
{
if(n[10].getText()!="")
{
if((nullPointer==6)|(nullPointer==9)|(nullPointer==11)|(nullPointer==14))
{
swap(10,nullPointer);
}
}
}
if(ae.getSource()==n[11])
{
if(n[11].getText()!="")
{
if((nullPointer==7)|(nullPointer==10)|(nullPointer==15))
{
swap(11,nullPointer);
}
}
}
if(ae.getSource()==n[12])
{
if(n[12].getText()!="")
{
if((nullPointer==8)|(nullPointer==13))
{
swap(12,nullPointer);
}
}
}
if(ae.getSource()==n[13])
{
if(n[13].getText()!="")
{
if((nullPointer==12)|(nullPointer==9)|(nullPointer==14))
{
swap(13,nullPointer);
}
}
}
if(ae.getSource()==n[14])
{
if(n[14].getText()!="")
{
if((nullPointer==13)|(nullPointer==10)|(nullPointer==15))
{
swap(14,nullPointer);
}
}
}
if(ae.getSource()==n[15])
{
if(n[15].getText()!="")
{
if((nullPointer==14)|(nullPointer==11))
{
swap(15,nullPointer);
win();
}
}
}
if(ae.getSource()==help)
{
JOptionPane.showMessageDialog(this,
"Move the numbers around the matrix\nusing the empty box, such that all the\nboxes are filled with the numbers in\nthe ascending order with the empty\nbox in the bottom right position.\nAll the best :D","Instructions",JOptionPane.INFORMATION_MESSAGE);
}
if(ae.getSource()==reset)
{
Load("default");
}
if(ae.getSource()==Exit)
{
dispose();
}
if(ae.getSource()==SaveGame)
{
String filename=JOptionPane.showInputDialog(this,"Enter filename:","Save Game",JOptionPane.INFORMATION_MESSAGE);
if(filename!=null)
{
tempfile=new File(filename+".ng");
if(!tempfile.exists())
{
tempfile.createNewFile();
}
bw=new BufferedWriter(new FileWriter(tempfile.getAbsoluteFile()));
for(int i=0;i<16;i++)
{
if(n[i].getText()=="")
bw.write("99\n");
else
bw.write(n[i].getText()+"\n");
}
bw.write(String.valueOf(count)+"\n");
bw.write(String.valueOf(nullPointer)+"\n");
bw.close();
JOptionPane.showMessageDialog(this,"Game saved");
}
}
if(ae.getSource()==LoadGame)
{
String filename=JOptionPane.showInputDialog(this,"Enter filename:","Load Game",JOptionPane.INFORMATION_MESSAGE);
if(filename!=null)
{
br=new BufferedReader(new FileReader(filename+".ng"));
for(int i=0;i<16;i++)
{
n[i].setText(br.readLine());
}
count=Integer.parseInt(br.readLine());
nullPointer=Integer.parseInt(br.readLine());
n[nullPointer].setText("");
JOptionPane.showMessageDialog(this,"Game loaded");
}
}
l1.setText("Moves:"+count);
}
catch(FileNotFoundException e)
{
JOptionPane.showMessageDialog(this,"File does not exist","File read error",JOptionPane.WARNING_MESSAGE);
}
catch(Exception e)
{
JOptionPane.showMessageDialog(this,e.getClass().getName(),"File Error",JOptionPane.INFORMATION_MESSAGE);
}
}
}
numbergame n1;
void setup(){
n1=new numbergame();
}


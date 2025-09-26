Turtle t;

void setup() {
  size(600, 400); // the canvas size
  background(50); // a dark gray background

  // Your high-level code goes here
  t = new Turtle(this);


  drawmyname();

  // End your high-level code here

  // This shows where the Turtle ends up
  t.render();
}

// Your methods can be defined down here
public void drawmyname() {

  t.setColor(100, 150, 175);
  t.setStrokeWeight(4.6);
  
  //letter S
  t.right(180);
  t.forward(27);
  t.left(90);
  t.forward(15);
  t.left(90);
  t.forward(27);
  t.right(90);
  t.forward(27);
  t.right(90);
  t.forward(27);
  
  //letter u
  t.penUp();
  t.left(180);
  t.forward(40);
  t.penDown();
  t.left(90);
  t.forward(27);
  t.penUp();
  t.right(90);
  t.forward(20);
  t.penDown();
  t.right(90);
  t.forward(27);
  t.right(90);
  t.forward(20);
  t.penUp();
  t.right(180);
  t.forward(35);
  t.left(90);
  t.penDown();
  
  //Letter k
  t.forward(45);
  t.right(180);
  t.forward(28);
  t.left(40);
  t.forward(22);
  t.right(180);
  t.forward(22);
  t.right(90);
  t.forward(15);
  t.right(40);
  t.penUp();
  t.forward(15);
  
  //letter i
  t.penDown();
  t.right(90);
  t.forward(1);
  t.penUp();
  t.forward(10);
  t.penDown();
  t.forward(15);
  
  t.hide();
  
  
}

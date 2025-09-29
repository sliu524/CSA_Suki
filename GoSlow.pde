Turtle t;

void setup() {
  size(600, 400); // the canvas size
  background(50); // a dark gray background

  // Your high-level code goes here
  t = new Turtle(this);

  // Change the size HERE!!
  drawmyname(50);

  // End your high-level code here

  // This shows where the Turtle ends up
  t.render();
}

// Your methods can be defined down here
public void drawmyname(int size) {

  t.setColor(100, 150, 175);
  t.setStrokeWeight(4.6);
  
  //letter S
  t.jump(-225,-175);
  letterS(size);
  letteru(size);
  letterk(size);
  letteri(size);
  t.hide();
}
    
  
public void letterS(int size) {
  t.jump(size,0);
  t.right(180);
  t.forward(size);
  t.left(90);
  t.forward(size*0.6);
  t.left(90);
  t.forward(size);
  t.right(90);
  t.forward(size*0.7);
  t.right(90);
  t.forward(size);
}

public void letteru(int size) {
  t.jump(size*1.3,-(size*0.7));
  t.left(90);
  t.forward(size*0.7);
  t.left(90);
  t.forward(size*0.6);
  t.left(90);
  t.forward(size*0.7);
}

public void letterk(int size) {
  t.jump(size*0.4,-(size*0.6));
  t.right(180);
  t.forward(size*1.3);
  t.right(180);
  t.jump(0,-(size*0.4));
  t.right(50);
  t.forward(size*0.4);
  t.penUp();
  t.right(180);
  t.forward(size*0.4);
  t.left(40);
  t.penDown();
  t.left(45);
  t.forward(size*0.5);
  t.left(55);
}

public void letteri(int size){
  t.jump(size*0.4,0);
  t.left(90);
  t.forward(size*0.5);
  t.jump(0,-size*0.2);
  t.forward(size*0.04);
}

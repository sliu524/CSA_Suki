Turtle t;

void setup() {
  size(600, 400); // the canvas size
  background(50); // a dark gray background

  // Your high-level code goes here
  Turtle t = new Turtle(this);
  t.setColor(100,150,100);
  t.forward(50);
  t.right(90);
  t.forward(50);

  // End your high-level code here

  // This shows where the Turtle ends up
  t.render();
}

// Your methods can be defined down here

// Turtle.pde — a Processing-friendly Turtle class with a classic API.
import processing.core.PApplet;

public class Turtle {
  private final PApplet p;
  private float x, y;              // current position
  private float headingDeg = 0;    // 0° = east; left(90) faces up
  private boolean penDown = true;
  private boolean visible = true;

  private int penColor;
  private float penWeight = 2f;

  // Marker size for the turtle "cursor"
  private float markerSize = 12f;

  // Constructors
  Turtle(PApplet parent) {
    this(parent, parent.width / 2f, parent.height / 2f);
  }

  Turtle(PApplet parent, float startX, float startY) {
    this.p = parent;
    this.x = startX;
    this.y = startY;
    this.penColor = parent.color(0); // default black
  }

  // --- Movement ---

  // Move forward by d pixels, drawing a segment if pen is down.
  Turtle forward(float d) {
    float rad = PApplet.radians(headingDeg);
    float nx = x + d * PApplet.cos(rad);
    float ny = y - d * PApplet.sin(rad); // minus because screen y grows downward
    lineTo(nx, ny);
    return this;
  }

  // Move backward by d pixels.
  Turtle back(float d) {
    return forward(-d);
  }

  // Turn left (counterclockwise) by angle degrees.
  Turtle left(float angle) {
    headingDeg = normalize(headingDeg + angle);
    return this;
  }

  // Turn right (clockwise) by angle degrees.
  Turtle right(float angle) {
    headingDeg = normalize(headingDeg - angle);
    return this;
  }

  // Go to absolute coordinate.
  Turtle goTo(float nx, float ny) {
    return setPosition(nx, ny);
  }

  // Set absolute position; draws if pen is down.
  Turtle setPosition(float nx, float ny) {
    if (penDown) {
      p.stroke(penColor);
      p.strokeWeight(penWeight);
      p.line(x, y, nx, ny);
    }
    x = nx;
    y = ny;
    return this;
  }

  // Move relative to current position, drawing if pen is down
  Turtle go(float dx, float dy) {
    setPosition(x + dx, y + dy);
    return this;
  }

  // Convenience: move without drawing, then restore pen state.
  Turtle jumpTo(float nx, float ny) {
    boolean wasDown = penDown;
    penUp();
    setPosition(nx, ny);
    if (wasDown) penDown();
    return this;
  }

  // Move relative to current position without drawing
  Turtle jump(float dx, float dy) {
    boolean wasDown = penDown;
    penUp();
    setPosition(x + dx, y + dy);
    if (wasDown) penDown();
    return this;
  }

  // Set orientation so 0°=right, 90°=up, etc.
  Turtle setHeading(float degrees) {
    headingDeg = normalize(degrees);
    return this;
  }

  // Point toward a specific coordinate.
  Turtle turnTo(float tx, float ty) {
    float dx = tx - x;
    float dy = y - ty; // invert
    float deg = PApplet.degrees(PApplet.atan2(dy, dx));
    return setHeading(deg);
  }

  // Home to sketch center (no clearing).
  Turtle home() {
    return setPosition(p.width / 2f, p.height / 2f).setHeading(0);
  }

  // --- Pen & style ---

  Turtle penUp() {
    penDown = false;
    return this;
  }
  Turtle penDown() {
    penDown = true;
    return this;
  }
  boolean isDown() {
    return penDown;
  }

  Turtle setColor(int gray) {
    penColor = p.color(gray);
    return this;
  }

  Turtle setColor(int r, int g, int b) {
    penColor = p.color(r, g, b);
    return this;
  }

  Turtle setStrokeWeight(float w) {
    penWeight = PApplet.max(0f, w);
    return this;
  }

  // Show/hide the turtle marker
  Turtle show() {
    visible = true;
    return this;
  }
  Turtle hide() {
    visible = false;
    return this;
  }
  boolean isVisible() {
    return visible;
  }

  // Marker (turtle icon) size
  Turtle setMarkerSize(float s) {
    markerSize = PApplet.max(0f, s);
    return this;
  }

  // --- Getters ---
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getHeading() {
    return headingDeg;
  }

  // --- Rendering ---

  // Call from your draw() if you want the turtle cursor to be visible.
  void render() {
    if (!visible) return;
    p.pushMatrix();
    p.translate(x, y);
    p.rotate(-PApplet.radians(headingDeg)); // align marker with turtle heading
    p.noFill();
    p.stroke(255, 255, 255);
    p.strokeWeight(1.5f);
    float s = markerSize;
    // A simple triangle arrow: tip to the right
    p.beginShape();
    p.vertex( 0.6f * s, 0);
    p.vertex(-0.5f * s, 0.4f * s);
    p.vertex(-0.3f * s, 0);
    p.vertex(-0.5f * s, -0.4f * s);
    p.endShape(PApplet.CLOSE);
    p.popMatrix();
  }

  // --- Internals ---

  private void lineTo(float nx, float ny) {
    if (penDown) {
      p.stroke(penColor);
      p.strokeWeight(penWeight);
      p.line(x, y, nx, ny);
    }
    x = nx;
    y = ny;
  }

  private float normalize(float deg) {
    deg %= 360f;
    if (deg < 0) deg += 360f;
    return deg;
  }
}

# Turtle Class Public API (Processing Java Mode)

This document describes the public API of the `Turtle` class for Processing (Java mode).  
The API is designed to mirror the traditional Java/Python-style turtle graphics API.

---

## Constructors
```java
Turtle(PApplet parent)
Turtle(PApplet parent, float startX, float startY)
```
- Creates a turtle object centered in the sketch or at the given coordinates.

---

## Movement
```java
forward(float distance)
back(float distance)
left(float angle)
right(float angle)
setHeading(float degrees)
turnTo(float x, float y)
go(float x, float y) // moves relative to current position
goTo(float x, float y) // moves to specific coordinates
jump(float x, float y) // same as go, but pen is always up
jumpTo(float x, float y) // same as goTo but pen is always up
```

---

## Pen & Style
```java
penUp()
penDown()

setColor(int gray)
setColor(int r, int g, int b)

setStrokeWeight(float w)
setMarkerSize(float size)
```

---

## Rendering
```java
void render()
```
- Draws the turtle marker at its current position and heading.

---

## Notes
- Angles are in degrees. `0°` points **right**, `left(90)` faces **up**.
- `forward()` draws if the pen is down; use `jump` or `jumpTo` to move without drawing.
- Colors use Processing's `color(r,g,b)` model.

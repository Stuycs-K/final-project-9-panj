public class Ball {
  private float x, y;
  private float xD, yD;
  private static final int r=10;
  private int re, g, b;
  public Ball(float xPos, float yPos, float xSpe, float ySpe) {
    x = xPos;
    y = yPos;
    xD = xSpe;
    yD = ySpe;
    re=int(random(255));
    g=int(random(255));
    b=int(random(255));
  }
  void display() {
    ellipseMode(CENTER);
    fill(r, g, b);
    circle(x, y, 2*r);
  }
  void move() {
    x+=xD;
    y+=yD;
    if (x+r>width || x-r<0) xD*=-1;
    if (y+r>height || y-r<0) yD*=-1;
  }
}

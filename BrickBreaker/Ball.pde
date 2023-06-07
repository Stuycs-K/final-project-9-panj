public class Ball {
  private float x, y;
  private float xD, yD;
  private static final int r=10;
  public Ball(float xPos, float yPos, float xSpe, float ySpe) {
    x = xPos;
    y = yPos;
    xD = xSpe;
    yD = ySpe;
  }
  void display() {
    ellipseMode(CENTER);
    fill(255);
    circle(x, y, 2*r);
  }
  void move() {
    x+=2*xD;
    y+=2*yD;
    if (x+r>width || x-r==0) xD*=-1;
    if (y+r>height || y-r==0) yD*=-1;
  }
}

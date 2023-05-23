public class Ball {
  private float x,y;
  private float xD,yD;
  private static final int r=10;
  public Ball(float xPos, float yPos, float xSpe, float ySpe) {
    x = xPos;
    y = yPos;
    xD = xSpe;
    yD = ySpe;
  }
  void display() {
    fill(255);
    circle(x, y, 2*r);
  }
  void move() {
    x+=2*xD;
    y+=2*yD;
    if(x>width-r || x<r) xD*=-1;
    if(y>height-r || y<r) yD*=-1;
  }
}

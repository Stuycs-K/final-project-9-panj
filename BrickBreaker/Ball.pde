public class Ball {
  private float x,y;
  private float xD,yD;
  private static final int r=20;
  public Ball(float xPos, float yPos, float xSpe, float ySpe) {
    x = xPos;
    y = yPos;
    xD = xSpe;
    yD = ySpe;
  }
  void display() {
    fill(255);
    circle(x, y, r);
  }
  void move(){
    x+=xD;
    y+=yD;
    if (x+r>=width || x-r<=0) xD*=-1;
    if (y+r>=height || y-r<=0) yD*=-1;
  }
}

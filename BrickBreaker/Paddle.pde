public class Paddle {
  private float x, y;
  private int movement=10;
  private int rwidth=50;
  private static final int rheight=10;
  private int r, g, b;
  public Paddle(float xPos) {
    x=xPos;
    y=640;
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
  }
  public void display() {
    rectMode(CENTER);
    fill(r, g, b);
    rect(x, y, 2*rwidth, 2*rheight, 15);
  }
  public void moveLeft() {
    if (x-rwidth-movement>=0) x-=movement;
  }
  public void moveRight() {
    if (x+rwidth+movement<=width) x+=movement;
  }
}

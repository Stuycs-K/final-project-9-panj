public class Paddle {
  private float x, y;
  private int movement=10;
  private int rwidth=50;
  private static final int rheight=10;
  public Paddle(float xPos) {
    x=xPos;
    y=640;
  }
  public void display() {
    rectMode(CENTER);
    fill(255);
    rect(x, y, 2*rwidth, 2*rheight, 15);
  }
  public void moveLeft() {
    if (x-rwidth-movement>=0) x-=movement;
  }
  public void moveRight() {
    if (x+rwidth+movement<=width) x+=movement;
  }
}

public class Paddle {
  private float x, y;
  private int movement=10;
  private static final int rwidth=100;
  private static final int rheight=20;
  public Paddle(float xPos) {
    x=xPos;
    y=height*4/5;
  }
  public void display() {
    rectMode(CENTER);
    fill(255);
    rect(x, y, rwidth, rheight, 15);
  }
  public void moveLeft() {
    if (x>=movement) x-=movement;
  }
  public void moveRight() {
    if (x<=width-movement-rwidth) x+=movement;
  }
}

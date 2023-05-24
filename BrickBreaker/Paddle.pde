public class Paddle {
  private float x;
  private static final int movement=10;
  public Paddle(float xPos) {
    x=xPos;
  }
  public void display() {
    fill(255);
    rect(x, height*6/7, 100, 20, 15);
  }
  public void moveLeft() {
    if (x>=movement) x-=movement;
  }
  public void moveRight() {
    if (x<=width-movement) x+=movement;
  }
}

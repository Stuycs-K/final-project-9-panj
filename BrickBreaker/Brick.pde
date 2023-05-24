public class Brick {
  private float x, y;
  private static final int rwidth=100;
  private static final int rheight=50;
  public Brick(float xPos, float yPos) {
    x=xPos;
    y=yPos;
  }
  public void display() {
    fill(255);
    rect(x, y, rwidth, rheight);
  }
}

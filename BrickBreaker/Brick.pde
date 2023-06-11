public class Brick {
  private float x, y;
  private static final int rwidth=50;
  private static final int rheight=25;
  public Brick(float xPos, float yPos) {
    x=xPos;
    y=yPos;
  }
  public void display() {
    rectMode(CENTER);
    fill(255);
    rect(x, y, 2*rwidth, 2*rheight);
  }
}

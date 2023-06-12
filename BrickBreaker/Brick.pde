public class Brick {
  private float x, y;
  private static final int rwidth=50;
  private static final int rheight=25;
  private int r, g, b;
  public Brick(float xPos, float yPos) {
    x=xPos;
    y=yPos;
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
  }
  public void display() {
    rectMode(CENTER);
    fill(r, g, b);
    rect(x, y, 2*rwidth, 2*rheight);
  }
}

public class Paddle{
  private float x,y;
  public Paddle(float xPos, float yPos){
    x=xPos;
    y=yPos;
  }
  public void display(){
    fill(255);
    rect(x,y,100,20,15);
  }
}

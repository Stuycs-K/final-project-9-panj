public class Paddle{
  private float x;
  public Paddle(float xPos){
    x=xPos;
  }
  public void display(){
    fill(255);
    rect(x,height*6/7,100,20,15);
  }
  public void move(){
    if(keyPressed){
      if(key=='A' || key=='a') x-=10;
      else if(key=='D'|| key=='d') x+=10;
      else if (key == CODED) {
        if (keyCode == LEFT) x-=10;
        else if (keyCode == RIGHT) x+=10;
      }
    }
  }
}

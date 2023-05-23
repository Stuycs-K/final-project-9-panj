public class Paddle{
  private float x;
  private static final int movement=10;
  public Paddle(float xPos){
    x=xPos;
  }
  public void display(){
    fill(255);
    rect(x,height*6/7,100,20,15);
  }
  public void move(){
    if(keyPressed){
      if(key=='A' || key=='a'){
        if(x>=movement) x-=movement;
      }else if(key=='D'|| key=='d'){
        if(x<=width-movement) x+=movement;
      }else if (key == CODED) {
        if (keyCode == LEFT){
          if(x>=movement) x-=movement;
        }else if (keyCode == RIGHT){
          if(x<=width-movement) x+=movement;
        }
      }
    }
  }
}

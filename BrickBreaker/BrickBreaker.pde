ArrayList<Ball> balls=new ArrayList<Ball>(1);
ArrayList<Brick> bricks=new ArrayList<Brick>();
Paddle p;
Controller keyboardInput;
void keyPressed() {
  keyboardInput.press(keyCode);
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void collide() {
  for (int i=0; i<balls.size(); i++) {
    Ball b=balls.get(i);
    if (b.x+Ball.r>p.x && b.x<p.x+Paddle.rwidth && closeEnough(b.y+Ball.r,p.y)) {
      b.yD*=-1;
    }
  }
}
boolean closeEnough(float a, float b){
   return((Math.abs(a-b)/((a+b)/2))*100<0.145879);
}
void setup() {
  size(1200, 800);
  keyboardInput = new Controller();
  balls.add(new Ball(width/2, height/2, 1, 1));
  p=new Paddle(width/2);
  //for (int i=0; i<width; i+=Brick.rwidth) {
  //  for (int j=0; j<height/3; j+=Brick.rheight) {
  //    bricks.add(new Brick(i, j));
  //  }
  //}
}

void draw() {
  background(255);
  balls.get(0).display();
  for (int i=0; i<bricks.size(); i++) bricks.get(i).display();
  balls.get(0).move();
  p.display();
  if (keyboardInput.isPressed(Controller.P1_LEFT)) p.moveLeft();
  else if (keyboardInput.isPressed(Controller.P1_RIGHT)) p.moveRight();
  collide();
}

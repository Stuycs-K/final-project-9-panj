ArrayList<Ball> balls=new ArrayList<Ball>(1);
Paddle p;
Controller keyboardInput;
void keyPressed() {
  keyboardInput.press(keyCode);
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void setup() {
  size(1200, 800);
  keyboardInput = new Controller();
  balls.add(new Ball(width/2, height/2, 1, 1));
  p=new Paddle(width/2);
}

void draw() {
  background(255);
  balls.get(0).display();
  balls.get(0).move();
  p.display();
  if(keyboardInput.isPressed(Controller.P1_LEFT)) p.moveLeft();
  else if(keyboardInput.isPressed(Controller.P1_RIGHT)) p.moveRight();
}

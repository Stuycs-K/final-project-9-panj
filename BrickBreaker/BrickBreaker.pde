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
void setup() {
  size(1200, 800);
  keyboardInput = new Controller();
  balls.add(new Ball(width/2, height/2, 1, 1));
  p=new Paddle(width/2);
  for (int i=0; i<width; i+=Brick.rwidth) {
    for (int j=0; j<height/3; j+=Brick.rheight) {
      bricks.add(new Brick(i, j));
    }
  }
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
void collide() {
  for (int i=0; i<balls.size(); i++) {
    Ball b=balls.get(i);
    if (b.x+Ball.r>p.x && b.x<p.x+Paddle.rwidth && b.y+Ball.r==p.y) {
      b.yD*=-1;
    }
    if (b.y+Ball.r>p.y && b.y<p.y+Paddle.rheight && (b.x+Ball.r==p.x || b.x==p.x+Paddle.rheight)) {
      b.xD*=-1;
    }
    for (int j=0; j<bricks.size(); j++) {
      Brick br=bricks.get(j);
      if (b.x+Ball.r>br.x && b.x<br.x+Brick.rwidth && (b.y+Ball.r==br.y || b.y==br.y+Brick.rheight)) {
        b.yD*=-1;
        bricks.remove(br);
      } else if (b.y+Ball.r>br.y && b.y<br.y+Brick.rheight && (b.x+Ball.r==br.x || b.x==br.x+Brick.rheight)) {
        b.xD*=-1;
        bricks.remove(br);
      }
    }
  }
}

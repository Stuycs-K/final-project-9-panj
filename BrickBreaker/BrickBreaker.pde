ArrayList<Ball> balls=new ArrayList<Ball>(1);
ArrayList<Brick> bricks=new ArrayList<Brick>();
Paddle p;
Controller keyboardInput;
int total=0;
String run;
void keyPressed() {
  keyboardInput.press(keyCode);
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void setup() {
  size(1200, 800);
  setupScreen();
}
void setupScreen() {
  keyboardInput = new Controller();
  total=0;
  balls=new ArrayList<Ball>(1);
  bricks=new ArrayList<Brick>();
  int[] randomspeed=new int[] {-1, 1};
  balls.add(new Ball(int(random(2*Ball.r, width-2*Ball.r)), height/2, randomspeed[int(random(1))], 1));
  p=new Paddle(int(random(2*Paddle.rwidth, width-2*Paddle.rwidth)));
  for (int i=Brick.rwidth; i<width; i+=2*Brick.rwidth) {
    for (int j=Brick.rheight; j<height/3; j+=2*Brick.rheight) {
      bricks.add(new Brick(i, j));
      total++;
    }
  }
  run="RUN";
}
void draw() {
  if (run.equals("RUN")) {
    background(255);
    for (int i=0; i<balls.size(); i++) {
      balls.get(i).display();
      balls.get(i).move();
    }
    for (int i=0; i<bricks.size(); i++) bricks.get(i).display();
    p.display();
    if (keyboardInput.isPressed(Controller.P1_LEFT)) p.moveLeft();
    else if (keyboardInput.isPressed(Controller.P1_RIGHT)) p.moveRight();
    collide();
    if (balls.size()==0) lose();
    else if (bricks.size()==0) win();
  } else if(run.equals("END")) {
    if (key==ENTER) setupScreen();
  }
}
void lose() {
  run="END";
  fill(0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 600, 400);
  textSize(50);
  text("SCORE: "+(total-bricks.size())+"/"+total, 600, 500);
  text("Press ENTER to restart", 600, 600);
}
void win() {
  run="END";
  fill(0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU WIN", 600, 400);
  textSize(50);
  text("SCORE: "+(total-bricks.size())+"/"+total, 600, 500);
  text("Press ENTER to restart", 600, 600);
}

void collide() {
  for (int i=0; i<balls.size(); i++) {
    Ball b=balls.get(i);
    if ((b.y+Ball.r==p.y-Paddle.rheight || b.y-Ball.r==p.y+Paddle.rheight) && (b.x+Ball.r>p.x-Paddle.rwidth && b.x-Ball.r<p.x+Paddle.rwidth)) b.yD*=-1;
    else if ((b.x+Ball.r==p.x-Paddle.rwidth || b.x-Ball.r==p.x+Paddle.rwidth) && (b.y+Ball.r>p.y-Paddle.rheight && b.y-Ball.r<p.y+Paddle.rheight)) b.xD*=-1;
    else if (b.y+Ball.r==height) balls.remove(b);
    for (int j=0; j<bricks.size(); j++) {
      Brick br=bricks.get(j);
      if ((b.y+Ball.r==br.y-Brick.rheight || b.y-Ball.r==br.y+Brick.rheight) && (b.x+Ball.r>br.x-Brick.rwidth && b.x-Ball.r<br.x+Brick.rwidth)) {
        bricks.remove(br);
        b.yD*=-1;
      } else if ((b.x+Ball.r==br.x-Brick.rwidth || b.x-Ball.r==br.x+Brick.rwidth) && (b.y+Ball.r>br.y-Brick.rheight && b.y-Ball.r<br.y+Brick.rheight)) {
        bricks.remove(br);
        b.xD*=-1;
      }
    }
  }
}

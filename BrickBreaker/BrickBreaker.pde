ArrayList<Ball> balls=new ArrayList<Ball>(1);
ArrayList<Brick> bricks=new ArrayList<Brick>();
Paddle p;
Controller keyboardInput=new Controller();
int total=0;
String run;
boolean normal=true;
void keyPressed() {
  keyboardInput.press(keyCode);
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void setup() {
  size(1200, 800);
  balls.add(new Ball(width/2,height/2,1,1));
  balls.add(new Ball(width/2,height/2,-1,1));
  balls.add(new Ball(width/2,height/2,1,-1));
  balls.add(new Ball(width/2,height/2,-1,-1));
  run="START";
}
void setupScreen() {
  keyboardInput = new Controller();
  total=0;
  balls=new ArrayList<Ball>(1);
  bricks=new ArrayList<Brick>();
  int[] randomspeed=new int[] {-1, 1};
  if(normal) balls.add(new Ball(int(random(2*Ball.r, width-2*Ball.r)), height/2, randomspeed[int(random(1))], 1));
  else balls.add(new Ball(int(random(2*Ball.r, width-2*Ball.r)), height/2, 2.5*randomspeed[int(random(1))], 2.5));
  p=new Paddle(width/2);
  for (int i=Brick.rwidth; i<width; i+=2*Brick.rwidth) {
    for (int j=Brick.rheight; j<height*3/8; j+=2*Brick.rheight) {
      bricks.add(new Brick(i, j));
      total++;
    }
  }
  run="RUN";
}
void cheatScreen() {
  keyboardInput = new Controller();
  total=0;
  balls=new ArrayList<Ball>(1);
  bricks=new ArrayList<Brick>();
  balls.add(new Ball(200, 400, 1, 1));
  total++;
  bricks.add(new Brick(500, 700));
  run="CHEAT";
}
void draw() {
  if (run.equals("START")) {
    background(173,216,230);
    for(int i=0;i<balls.size();i++){
      balls.get(i).display();
      balls.get(i).move();
    }
    fill(0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Brick Breaker", 600, 100);
    textSize(50);
    text("Difficulty", 600, 400);
    if (normal) {
      rectMode(CENTER);
      fill(0, 0, 255);
      rect(500, 500, 162, 100);
      fill(255);
      rect(700, 500, 162, 100);
    } else {
      rectMode(CENTER);
      fill(255);
      rect(500, 500, 162, 100);
      fill(255, 0, 0);
      rect(700, 500, 162, 100);
    }
    fill(0);
    text("Normal", 500, 500);
    text("Difficult", 700, 500);
    if (mouseX >= 500-162 && mouseX <= 500+162  && mouseY >= 500-100 && mouseY <= 500+100) normal=true;
    else if (mouseX >= 700-162 && mouseX <= 700+162 && mouseY >= 500-100 && mouseY <= 500+100) normal=false;
    text("Press ENTER to start", 600, 600);
    if (key==ENTER) setupScreen();
    textSize(25);
    text("Press RIGHT mouse button for cheat", 600, 775);
    if (mousePressed && (mouseButton == RIGHT)) cheatScreen();
  } else if (run.equals("RUN")) {
    background(255);
    for (int i=0; i<balls.size(); i++) {
      balls.get(i).display();
      balls.get(i).move();
    }
    for (int i=0; i<bricks.size(); i++) bricks.get(i).display();
    p.display();
    if (keyboardInput.isPressed(Controller.P1_LEFT)) p.moveLeft();
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) p.moveRight();
    collide();
    if (balls.size()==0) {
      lose();
      run="END";
    } else if (bricks.size()==0) {
      win();
      run="END";
    }
  } else if (run.equals("CHEAT")) {
    background(255);
    for (int i=0; i<balls.size(); i++) {
      balls.get(i).display();
      balls.get(i).move();
    }
    for (int i=0; i<bricks.size(); i++) bricks.get(i).display();
    for (int i=0; i<balls.size(); i++) {
      for (int j=0; j<bricks.size(); j++) {
        if (balls.get(i).y+Ball.r==bricks.get(j).y-Brick.rheight) {
          bricks.remove(j);
          win();
          run="CHEATEND";
        }
      }
    }
  } else if (run.equals("END")) {
    if (key==ENTER) setupScreen();
    else if (key==BACKSPACE) run="START";
  } else if (run.equals("CHEATEND")) {
    if (key==ENTER) cheatScreen();
    else if (key==BACKSPACE) run="START";
  }
}
void lose() {
  fill(0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 600, 400);
  textSize(50);
  text("SCORE: "+(total-bricks.size())+"/"+total, 600, 500);
  text("Press ENTER to restart", 600, 600);
  text("Press BACKSPACE to return to menu", 600, 650);
}
void win() {
  fill(0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU WIN", 600, 400);
  textSize(50);
  text("SCORE: "+(total-bricks.size())+"/"+total, 600, 500);
  text("Press ENTER to restart", 600, 600);
  text("Press BACKSPACE to return to menu", 600, 650);
}
void collide() {
  for (int i=0; i<balls.size(); i++) {
    Ball b=balls.get(i);
    if ((b.y+Ball.r==p.y-Paddle.rheight || b.y-Ball.r==p.y+Paddle.rheight) && (b.x+Ball.r>p.x-p.rwidth && b.x-Ball.r<p.x+p.rwidth)) b.yD*=-1;
    else if ((b.x+Ball.r==p.x-p.rwidth || b.x-Ball.r==p.x+p.rwidth) && (b.y+Ball.r>p.y-Paddle.rheight && b.y-Ball.r<p.y+Paddle.rheight)) b.xD*=-1;
    else if (b.y+Ball.r==height) balls.remove(b);
    for (int j=0; j<bricks.size(); j++) {
      Brick br=bricks.get(j);
      if ((b.y+Ball.r==br.y-Brick.rheight || b.y-Ball.r==br.y+Brick.rheight) && (b.x+Ball.r>br.x-Brick.rwidth && b.x-Ball.r<br.x+Brick.rwidth)) {
        bricks.remove(br);
        j--;
        b.yD*=-1;
        if (!normal) p.rwidth*=0.99999999;
      } else if ((b.x+Ball.r==br.x-Brick.rwidth || b.x-Ball.r==br.x+Brick.rwidth) && (b.y+Ball.r>br.y-Brick.rheight && b.y-Ball.r<br.y+Brick.rheight)) {
        bricks.remove(br);
        j--;
        b.xD*=-1;
        if (!normal) p.rwidth*=0.99999999;
      }
    }
  }
}

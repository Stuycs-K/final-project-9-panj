ArrayList<Ball> balls=new ArrayList<Ball>(1);
Paddle p;
void setup(){
  size(1200,800);
  balls.add(new Ball(width/2,height/2,1,1));
  p=new Paddle(width/2,height*3/4);
}

void draw(){
  background(255);
  balls.get(0).display();
  balls.get(0).move();
  p.display();
}

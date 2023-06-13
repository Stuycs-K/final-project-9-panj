# Work Log

## Justin Pan

### 05/22

-Added the Ball class and tested if it bounced and moved correctly

### 05/23

-Added the Paddle class and tested if it displayed correctly

### 05/24

-Added given Controller to fix Paddle movement based on key presses
-Added a basic Brick class and tested display

### 05/25

-Began to add collision movements

### 05/26-29

-Finished Paddle collision
-Began Brick collision
-Added Brick removal

### 05/30

-Finish Brick collisions
-Added screen freezing conditions for win/loss

### 05/31
-Finished Win/Lose Screen
-Tweak Collisions

### 06/01
-Added Demo Branch
-Added "cheat codes"

### 06/06
-Begin fixing collisions
-Changing shapes to be center
-Fixed Ball, Brick, and Paddle display

### 06/09-11
-Finished fixing collisions
-Added normal/difficult/cheat mode (Difficult exponentially decreases Paddle length. Cheat mode places one Brick in the path to win.)
-Added start screen
-Added end screen with score
-Added colors to everything
-Added keyboard buttons

# DEV LOG
To start the game, select your game mode with mouse and key. All the key buttons are working correctly. The replay options are also working correctly. Every combination of options should also be working correctly. The only bug is a problem with the game. Sometimes, in the correct conditions, the ball will be aligned directly between two Bricks, and because the code is set to bounce off in the negated direction, the Ball continues straight. In another situation, the Ball may be just within the Paddle movement or Brick, and there will be a chaining effect, where the Ball will wrap around the Paddle or continuously jump around from Brick to Brick. There's a strange bug where the Ball cannot see the Bricks, but this fixes up by stopping the code and re-running it. These are the only noticable bugs. Content resources that were extremely helpful were OrbPhysics and Controller. I used OrbPhysics for the wall bouncing effect and I adjusted the values to have the correct size ball. From OrbPhysics, I also copied a similar structure for Brick and Paddle. Controller was completely from Mr. K and I only adjusted the buttons to add more flexibility in button use. This allowed the Paddle to move without a double input or holding effect.

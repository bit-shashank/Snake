/*
  An enum to store the directions
  in which the snake can go.
*/
enum Direction{
  top,down,left,right;
}


Snake snake;
Direction dir;
Button replay;

int cellSize=40;
boolean inGame;
int speed=10;
int maxX;
int maxY;


void setup(){
  //full screen mode
  size(displayWidth,displayHeight);
  
  maxX=width/cellSize;
  maxY=height/cellSize;
  
  //Initially making the snake move in right direction
  dir=Direction.right;
  snake=new Snake();
  inGame=true;
  
  //Replay button 
  replay=new Button(loadImage("redo.png"),width/2-cellSize/2,height/2+cellSize*2,cellSize*2,cellSize*2);
}


void draw(){
   background(0);
   snake.show();
   
   if(inGame){
     speed=10;
     
     //move the snake in the current direction 
     snake.update(dir);
     
     // Displaying score at the top left corner
     fill(255);
     textSize(cellSize);
     textAlign(NORMAL);
     text("Score: "+(snake.body.size()-3),10,30);
   }
     
   else{
     //Game over text
     textAlign(CENTER);
     textSize(cellSize*2);
     fill(255);
     text("Game Over",width/2,height/2-100);
     
     //Score text
     fill(255);
     textSize(cellSize);
     text("Score: "+(snake.body.size()-3),width/2,height/2-50);
     
     //replay button
     replay.show();
   }
   
   //Setting the frame rate according to speed variable
   frameRate(speed);
}



/*
  Controls the diretion of the snake based on key pressed
*/
void keyPressed(){
  if(keyCode==UP){
    if(dir!=Direction.down)
      dir=Direction.top;
  }
  if(keyCode==DOWN){
    if(dir!=Direction.top)
      dir=Direction.down;
  }
  if(keyCode==LEFT){
    if(dir!=Direction.right)
      dir=Direction.left;
  }
  if(keyCode==RIGHT){
    if(dir!=Direction.left)
      dir=Direction.right;
  }
}


/*
  Controlling the snake with mouse and touch
*/
void mousePressed(){
  
  if(!inGame && replay.isOn(mouseX,mouseY)){
      snake.reset();
      dir=Direction.right;
      inGame=true;
  }
  
  PVector snakeHead=snake.body.get(snake.body.size()-1);
  
  //turns the snake top or down based on mouse click
  if(dir==Direction.left || dir==Direction.right){
    if(mouseY<snakeHead.y*cellSize){
      dir=Direction.top;
    }
    else{
      dir=Direction.down;
    }
  }
  
  //turns the snake left or right based on mouse click
  else if(dir==Direction.top || dir==Direction.down){
    if(mouseX<snakeHead.x*cellSize){
      dir=Direction.left;
    }
    else{
      dir=Direction.right;
    }
  }
  
} 

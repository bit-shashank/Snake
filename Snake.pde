import java.util.ArrayList;

class Snake{
  ArrayList<PVector> body=new ArrayList<PVector>();
  Apple apple;
  Direction dir;
  
  
  public Snake(){
    reset();
    apple=new Apple();
    apple.setNewPosition(body);
  }
  
  
  void update(Direction d){
    move(d);
    eat();
    collide();
    //println(body);
  }
  
  void reset(){
     int hx=floor(width/cellSize/2);
     int hy=floor(height/cellSize/2);
     this.dir=Direction.right;
     body.clear();
     body.add(new PVector(hx-1,hy));
     body.add(new PVector(hx,hy));
     body.add(new PVector(hx+1,hy));
  }
  
  
  
  /*
    Shows the snake and apple
  */
  void show(){
    fill(255);
    //green value for tale
    int green=55; 
    
    int step=200/body.size();
    
    for(PVector part:body){
      fill(0,green,0);
      rect(part.x*cellSize,part.y*cellSize,cellSize,cellSize,7);
      green+=step;
    }
    apple.show();
  }
  
  
  
  /*
    Moves the snake in the direction decided by the dir variable
  */
  void move(Direction d){
    this.dir=d;
    PVector head=body.get(body.size()-1);
    PVector nhead=head.copy();
    
    if(dir==Direction.top){
      nhead.y=head.y-1;
      if(nhead.y<0)
        nhead.y=maxY-1;
    }
    
    if(dir==Direction.down){
      nhead.y=head.y+1;
      if(nhead.y>maxY-1)
        nhead.y=0;
    }
    
    if(dir==Direction.left){
      nhead.x=head.x-1;
      if(nhead.x<0)
        nhead.x=maxX-1;
    }
    
    if(dir==Direction.right){
      nhead.x=head.x+1;
      if(nhead.x>maxX-1)
        nhead.x=0;
    }
    
    body.add(nhead);
    body.remove(0);
  }
  

  
  

  /*
    This method checks if the snake has collided with its own body or not
  */
  void collide(){
    PVector head=body.get(body.size()-1);
    for(int i=0;i<body.size()-2;i++){
      PVector part=body.get(i);
      if(head.x==part.x && head.y==part.y){
         inGame=false;
      }
    } 
  }
  
  /*
    Checks if the snake has eaten the apple 
    and grows the size of the snake
  */
  void eat(){
    PVector head=body.get(body.size()-1);
    if(head.x==apple.x && head.y==apple.y){
       //Snake has eaten the apple
       //Now grow its size
       PVector newPart=new PVector(apple.x,apple.y);
       body.add(newPart);
       apple.setNewPosition(body);
    }
  }
 
}

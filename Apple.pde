class Apple{
  int x; // x-coordinate of apple
  int y; // y-coordinate of apple
 
 public Apple(){
   x=int(random(maxX));
   y=int(random(maxY));
 }
  void setNewPosition(ArrayList<PVector> body){
    //setting a random number between [0:maxX] and [0:maxY] respectively
    x=int(random(maxX));
    y=int(random(maxY));
    
    //Checking if the apple does not landed on snake body
    for(PVector part:body){
      if(x==part.x && y==part.y){
        // if the apple was on snake's body find a new location
        setNewPosition(body);
      }
    }
  }
  
  void show(){
    //shwow the apple as a red square
    fill(255,0,0);
    rect(x*cellSize,y*cellSize,cellSize,cellSize,7);
  }
} 

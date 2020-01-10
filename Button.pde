class Button{
  PImage img;
  int x,y,w,h;
  
  public Button(PImage img,int x,int y,int w,int h){
    this.img=img;
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
  void show(){
    image(img,x,y,w,h);
  }
  
  boolean isOn(int x,int y){
    return (x>this.x&&x<this.x+w && y>this.y && y<this.y+h);
  }
}

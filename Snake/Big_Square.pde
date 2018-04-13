class Big_Square{

  int x=0;
  int y=0;
  
  Big_Square(){};
  
  Big_Square(int X,int Y){
   x=X;
   y=Y;
  }

  void show(){
    image(foodImg,x,y,buffer*2,buffer*2);
  }
}
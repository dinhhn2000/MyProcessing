class Big_Food{
  int x;
  int y;
  Big_Square food;
  
  Big_Food(int[] X,int[] Y,int xFood,int yFood){
    Random tempX=new Random();
    Random tempY=new Random();
    x=tempX.nextInt(width/buffer)*buffer;
    y=tempY.nextInt(height/buffer)*buffer;
    while(testInSnakeBody(X,Y) == true || testOverFood(xFood,yFood) == true){
      x=tempX.nextInt(width/buffer)*buffer;
      y=tempY.nextInt(height/buffer)*buffer;
    }
  }
  
  boolean testInSnakeBody(int[] X,int[] Y){
    for(int i=0;i<X.length;i++){
      if(x==X[i] && y==Y[i]){
        return true;
      }
    }
    return false;
  }
  
  boolean testOverFood(int X,int Y){
    if(x == X && y == Y){
      return true;
    }
    return false;
  }
  
  void show(){
    food = new Big_Square(x,y);
    food.show();
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  
  
}
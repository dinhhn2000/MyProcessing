import java.util.Random;

class Food{
  int x;
  int y;
  Square food;
  
  Food(int[] X,int[] Y){        // Create food with snake data
    Random tempX=new Random();
    Random tempY=new Random();
    x=tempX.nextInt(width/buffer)*buffer;
    y=tempY.nextInt(height/buffer)*buffer;
    while(testInSnakeBody(X,Y)==true){
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
  
  void show(){
    food = new Square(x,y);
    food.show(2);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  
  
}
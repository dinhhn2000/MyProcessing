import java.util.*;

class Snake{
  
  int[] X={0};
  int[] Y={0};
  char keyPrevious;
  int count=0;
  int countBigFoodTime=0;
  boolean isBigFoodCreated=false;
  Square body;
  Food food = new Food(X,Y);
  Big_Food bigFood;
  Score score = new Score();
  
  Snake(){}
  
  void show(){
    food.show();
    move();
    if(eaten(isBigFoodCreated)==1){
      if(isBigFoodCreated == false){
        count++;
      }
      eat(1);
      score.scoreCalculate(1,countBigFoodTime);
    }
    if(eaten(isBigFoodCreated)==2){
      count = 0;
      eat(2);
      isBigFoodCreated = false;
      score.scoreCalculate(2,countBigFoodTime);
    }
    if(count%5==0 && count!=0){
      bigFood = new Big_Food(X,Y,food.getX(),food.getY());
      count++;
      isBigFoodCreated = true;
    }
    if(isBigFoodCreated == true){
      bigFood.show();
      countBigFoodTime++;
    }
    if(countBigFoodTime == 30){
      isBigFoodCreated = false;
      countBigFoodTime = 0;
    }
    config();
    for(int i=0;i<X.length;i++){
     body=new Square(X[i],Y[i]);
     body.show(1);
    } 
    score.show();
  }
  
  void move(){
    if(key!='a' && key!='s' && key!='d' && key!='w'){
      key=keyPrevious;
    }
    if(key=='d' && keyPrevious =='a'){
      key='a';
    }
    if(key=='a' && keyPrevious == 'd'){
      key='d';
    }
    if(key=='w' && keyPrevious == 's'){
      key='s';
    }
    if(key=='s' && keyPrevious == 'w'){
      key='w';
    }
    if(key=='d'){
      int tempX1=X[X.length-1];
      int tempY1=Y[Y.length-1];
      X[X.length-1]+=buffer;
      for(int i=X.length-2;i>=0;i--){
        int tempX2=X[i];
        int tempY2=Y[i];
        X[i]=tempX1;
        Y[i]=tempY1;
        tempX1=tempX2;
        tempY1=tempY2;
      }
    }
    if(key=='a'){
      int tempX1=X[X.length-1];
      int tempY1=Y[Y.length-1];
      X[X.length-1]-=buffer;
      for(int i=X.length-2;i>=0;i--){
        int tempX2=X[i];
        int tempY2=Y[i];
        X[i]=tempX1;
        Y[i]=tempY1;
        tempX1=tempX2;
        tempY1=tempY2;
      }
    }
    if(key=='w'){
      int tempX1=X[X.length-1];
      int tempY1=Y[Y.length-1];
      Y[Y.length-1]-=buffer;
      for(int i=X.length-2;i>=0;i--){
        int tempX2=X[i];
        int tempY2=Y[i];
        X[i]=tempX1;
        Y[i]=tempY1;
        tempX1=tempX2;
        tempY1=tempY2;
      }
    }
    if(key=='s'){
      int tempX1=X[X.length-1];
      int tempY1=Y[Y.length-1];
      Y[Y.length-1]+=buffer;
      for(int i=X.length-2;i>=0;i--){
        int tempX2=X[i];
        int tempY2=Y[i];
        X[i]=tempX1;
        Y[i]=tempY1;
        tempX1=tempX2;
        tempY1=tempY2;
      }
    }
    
    keyPrevious=key;
  }
  
  void config(){
   for(int i=0;i<X.length;i++){
    if(X[i]==width){
      X[i]=0;
    }
    if(Y[i]==height){
      Y[i]=0;
    }
    if(X[i]==-buffer){
      X[i]=width;
    }
    if(Y[i]==-buffer){
      Y[i]=height;
    } 
   }
  }
  
  void eat(int type){
    int[] tempX=new int[X.length+1];
    int[] tempY=new int[Y.length+1];
    for(int i=0;i<X.length;i++){
      tempX[i]=X[i];
      tempY[i]=Y[i];
    }
    if(keyPrevious=='a'){
      tempX[X.length]=X[X.length-1]-buffer;
      tempY[Y.length]=Y[Y.length-1];
      X=tempX;
      Y=tempY;
    }
    if(keyPrevious=='w'){
      tempX[X.length]=X[X.length-1];
      tempY[Y.length]=Y[Y.length-1]-buffer;
      X=tempX;
      Y=tempY;
    }
    if(keyPrevious=='s'){
      tempX[X.length]=X[X.length-1];
      tempY[Y.length]=Y[Y.length-1]+buffer;
      X=tempX;
      Y=tempY;
    }
    if(keyPrevious=='d'){
      tempX[X.length]=X[X.length-1]+buffer;
      tempY[Y.length]=Y[Y.length-1];
      X=tempX;
      Y=tempY;
    }
    if(type == 1){
      food = new Food(X,Y);
    }
  
  }
  
  int eaten(boolean isBigFoodCreated){
    if(X[X.length-1]==food.getX() && Y[Y.length-1]==food.getY()){
      return 1;
    }
    if(isBigFoodCreated==true){
      if(X[X.length-1]==bigFood.getX() && Y[Y.length-1]==bigFood.getY()){
        return 2;
      }
      if(X[X.length-1]==bigFood.getX()+buffer && Y[Y.length-1]==bigFood.getY()){
        return 2;
      }
      if(X[X.length-1]==bigFood.getX() && Y[Y.length-1]==bigFood.getY()+buffer){
        return 2;
      }
      if(X[X.length-1]==bigFood.getX()+buffer && Y[Y.length-1]==bigFood.getY()+buffer){
        return 2;
      }
    }
    return 0;
  }
  
  boolean die(){
    for(int i=0;i<X.length-1;i++){
      if(X[X.length-1]==X[i] && Y[Y.length-1]==Y[i]){
        return true;
      }
    }
    return false;
  }
  
}
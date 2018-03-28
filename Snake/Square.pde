int buffer=40;              // Size of the square

class Square{

  int x=0;
  int y=0;
  
  Square(){};
  
  Square(int X,int Y){
   x=X;
   y=Y;
  }

  void show(int type){
    if(type==1){    // Is snake
      //fill(100,200,150);
      //rect(x,y,buffer,buffer);
      image(snakeImg,x,y,buffer,buffer);
    }
    if(type==2){    // Is food
      //fill(255,100,150);
      //rect(x,y,buffer,buffer);
      image(foodImg,x,y,buffer,buffer);
    }
  }
  
}
import java.util.Random;

class Pipe{
  Random temp = new Random();
  int space = 120;
  int top = temp.nextInt(HEIGHT/2) + 20;
  int bottom = top + space;
  int w = 100;
  int x = WIDTH;
  int countFrame = 0;
  int buffer = 5;
  
  Pipe(){};
  
  void show(float X,float Y){
    noStroke();
    if(beingHit(X,Y) == true){
      fill(255,33,48);
      rect(x,0,w,top);
      rect(x,bottom,w,height-bottom);
    }
    else{
      fill(255);
      rect(x,0,w,top);
      rect(x,bottom,w,height-bottom);
    }
  }
  
  void update(){
    x -= buffer;
    countFrame++;
  }
  
  int getCountFrame(){
    return countFrame;
  }
  
  boolean beingHit(float X,float Y){
    if(X >= x && X <= x+w){
      if(Y < top || Y > bottom){
        return true;
      }
    }
    return false;
  }
  
  boolean passed(float X,float Y){
    if(X > x+w && X < x+w+buffer+2){
      if(Y >= top && Y <= bottom){
        return true;
      }
    }
    return false;
  }
  
}
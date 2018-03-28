class Score{
  int score;
  
  Score(){
    score=0;
  }
  
  void scoreCalculate(int type,int countBigFoodTime){
    if(type == 1){
      score+=30;
    }
    if(type == 2){
      score+=200 - countBigFoodTime*6;
    }
  }
  
  int getScore(){
    return score;
  }
  
  void show(){
    fill(255,100,150);
    text(score,buffer,buffer);
  }
  
}
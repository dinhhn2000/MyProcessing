class Score{
  int score;
  
  Score(){
    score=0;
  }
  
  int getScore(){
    return score;
  }
  
  void show(){
    fill(255,100,150);
    text(score,30,height-30);
  }
  
}
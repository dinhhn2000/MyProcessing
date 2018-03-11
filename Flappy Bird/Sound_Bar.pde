class Sound_Bar{
  float vol;
  
  Sound_Bar(){};
  
  void show(){
    fill(47,245,48);
    rect(0,0,vol*500+20,15);
  }
  
  void update(float volume){
    vol = volume;
  }
}
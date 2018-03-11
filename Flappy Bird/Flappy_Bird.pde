import processing.sound.*;
PFont font;
AudioIn mic;
Amplitude analyzer;
Sound_Bar soundBar;
Bird bird;
int WIDTH = 1080;
int HEIGHT = 480;
Pipe[] pipes = new Pipe[(int)WIDTH/210+2];
int countPipes = 1;
int countFrame = 0;
boolean hear = true;
Score score;


void setup(){
  size(1080,480);
  frameRate(60);
  
  bird = new Bird(); 
  pipes[0] = new Pipe();
  
  mic = new AudioIn(this, 0);
  mic.start();
  analyzer = new Amplitude(this);
  analyzer.input(mic);
  soundBar = new Sound_Bar();
  font = createFont("neuropol x rg.ttf", 30);
  textFont(font);
  score = new Score();
}


void draw(){
  background(20,0,77);
  countFrame++;
  bird.update();
  bird.show();
  for(int i=0;i<countPipes;i++){
    pipes[i].show(bird.x,bird.y);
    pipes[i].update();
  }
  
  if(pipes[0].getCountFrame() % 180 == 0){
    pipes[countPipes++] = new Pipe();
  }
  
  if(pipes[0].x == -pipes[0].w){
    for(int i=0;i<countPipes-1;i++){
      pipes[i] = pipes[i+1];
    }
    countPipes--;
  }
  
  if(countFrame == 5){
    countFrame = 0;
    hear = true;
  }
  
  float vol = analyzer.analyze();
  if(vol > 0.1  && hear == true){
    bird.up();
    hear = false;
    countFrame = 0;
  }
  
  soundBar.update(vol);
  soundBar.show();
  
  for(int i=0;i<countPipes;i++){
    if(pipes[i].beingHit(bird.x,bird.y) == true){
      pipes[i].show(bird.x,bird.y);
      score.score = 0;
      //noLoop();
    }
    if(pipes[i].passed(bird.x,bird.y) == true){
      score.score++;
      //noLoop();
    }
  }
  
  score.show();
}
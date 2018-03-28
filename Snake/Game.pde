Snake snake;
Food food;
PImage foodImg;
PImage snakeImg;
PFont font;

void setup(){
  size(720,480);
  background(255);
  frameRate(10);
  snake = new Snake();
  foodImg = loadImage("food.jpg");
  snakeImg = loadImage("snake.jpg");
  font = createFont("neuropol x rg.ttf",buffer);
  textFont(font);
}


void draw(){
  if(snake.die()){
    return;
  }
  background(255);
  snake.show();
  
}
import processing.sound.*;
AudioIn mic;
Amplitude analyzer;

Dinosaurs dino;
Tree tree;
Bird bird;
int type = 0;
int time = 0;
int score = 0;
boolean day = true;
int buffer = 15;


PImage imgDino;
PImage imgTree;
PImage imgBird;
PImage imgDino2;
PImage imgTree2;
PImage imgBird2;
PImage dayLight;
PImage nightView;

PFont font;

void setup() {
  size(640, 360);
  frameRate(30);

  dino = new Dinosaurs();
  tree = new Tree();
  bird = new Bird();


  imgDino = loadImage("dinosaur.jpg");
  imgTree = loadImage("tree.jpg");
  imgBird = loadImage("bird.jpg");
  imgDino2 = loadImage("lightDinosaur.jpg");
  imgTree2 = loadImage("lightTree.jpg");
  imgBird2 = loadImage("lightBird.jpg");
  dayLight = loadImage("day.jpg");
  nightView = loadImage("night.jpg");

  font = createFont("PressStart2P.ttf", 15);
  textFont(font);

  mic = new AudioIn(this, 0);
  mic.start();
  analyzer = new Amplitude(this);
  analyzer.input(mic);
}

void draw() {
  if (score%100 == 0 && score > 0) {
    if (day == true) {
      day = false;
    } else {
      day = true;
    }
    buffer += 5;
  }

  if (day == true) {
    background(255);
    fill(0);
    line(0, height-30, width, height-30);

    image(dayLight, width-300, 30, 200, 150);

    // Score part
    fill(90);
    text("SCORE", width*2/3-100, 30);
    text(score, width*2/3, 30);
  } else {
    background(93);
    fill(255);
    line(0, height-30, width, height-30);
    
    image(nightView, width-300, 30, 200, 150);

    // Score part
    fill(255);
    text(score, width*2/3, 30);
  }

  // Tree and bird part
  if (type == 0) {
    if (tree.x < -tree.w) {
      type = (int)random(2);
      tree = new Tree();
    }
    tree.show(day);
    tree.update();
  } else {
    if (bird.x < -bird.w) {
      type = (int)random(2);
      bird = new Bird();
    }
    bird.show(day);
    bird.update();
  }




  // Dinosaur part
  dino.update();
  float vol = analyzer.analyze();
  if (key == ' ' || vol > 0.2 ) {
    dino.jump();
    key = '0';
  }
  dino.show(day);

  if (dino.x+dino.w >tree.x && dino.x+dino.w < tree.x +tree.w) {
    if (dino.y + dino.h > tree.y) {
      noLoop();
    }
  }

  if (dino.x+dino.w > bird.x && dino.x+dino.w < bird.x +bird.w) {
    if (dino.y + dino.h  > bird.y) {
      noLoop();
    }
  }

  time++;
  if (time%10 == 0) {
    score++;
  }
}

void keyPressed() {
  if (key != '~') {
    loop();
  }
}

import peasy.*;

PVector gravity;
Firework[] hanabi;

PeasyCam cam;

void setup() {
  //fullScreen(P2D);
  fullScreen(P3D);
  frameRate(80);
  cam = new PeasyCam(this, 500);

  gravity = new PVector(0, 0.05);
  hanabi = new Firework[/*(int)random(6, width/80)*/  500];
  for (int i = 0; i<hanabi.length; i++) {
    hanabi[i] = new Firework();
  }
  background(0);
}

void draw() {
  /*fill(0, 50);
  noStroke();
  rect(0, 0, width, height);*/
  background(0);
  
  for (int i = 0; i<hanabi.length; i++) {
    hanabi[i].show();
    hanabi[i].update();
  }
}
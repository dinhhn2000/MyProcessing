Rain[] rains = new Rain[300];

void setup() {
  size(640, 360);
  frameRate(30);
  
  for(int i=0;i<rains.length;i++){
    rains[i] = new Rain();
  }
}

void draw() {
  background(230, 230, 250);
  for(int i=0;i<rains.length;i++){
    rains[i].show();
    rains[i].update();
  }
}
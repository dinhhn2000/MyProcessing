import java.util.Random;

class Rain {
  float x;
  float y;
  float gravity = random(1)/2000;
  int size = (int)random(10, 20);
  int time = 0;
  float thick;

  Rain() {
    x = random(width);
    y = random(-height*2, 0);
    gravity = random(0.05);
    thick = random(1, 3);
  }

  void show() {

    strokeWeight(thick);
    stroke(138, 43, 226);
    line(x, y, x, y+size);
  }

  void update() {
    time++;
    y = y + 0.5*gravity*time*time;

    if (y > height) {
      x = (int)random(width);
      y = random(-height / 5, 0);
      gravity = random(0.05);
      time = 0;
      thick = random(1, 3);
    }
  }
}
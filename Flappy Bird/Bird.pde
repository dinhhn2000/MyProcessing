class Bird {
  float y = HEIGHT/2;
  float x = 100;
  float gravity = 0.8;
  float velocity = 10;    // Speed  parameter
  int time = 0;
  float y0 = y;

  Bird() {
  };

  void show() {
    noStroke();
    fill (255, 245, 33);
    ellipse(x, y, 20, 20);
  } 

  void update() {
    if (key == ' ') {
      up();
      key = '~';
    }

    y = y0 - velocity*time + 0.5*gravity*time*time; 

    if (y > height) {
      y = height;
    }
    if (y < 0) {
      y = 0;
    }
    time++;
  }

  void up() {
    time = 0;
    y0 = y;
  }
}
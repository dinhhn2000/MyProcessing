class Dinosaurs {
  float w = 60;
  float h = 80;  
  float x = 100;
  float y = height - 30 - h;

  float velocity = 0;
  float gravity = 8;
  float upForce = 60;
  int time;

  Dinosaurs() {
  }

  void show(boolean day) {
    if (y > height - 30 - h && time > 1) {
      y = height - 30 - h;
      time = 0;
      velocity = 0;
    }
    if (y > height - 30 - h ) {
      y = height - 30 - h;
      time = 0;
    }
    if (day == true) {
      image(imgDino, x, y, w, h);
    } else {
      image(imgDino2, x, y, w, h);
    }
  }

  void update() {
    time++;
    y = height - 30 - h - velocity*time + 0.5*gravity*time*time;
  }

  void jump() {
    velocity = upForce;
  }
}
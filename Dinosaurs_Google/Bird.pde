class Bird {
  int x;
  int y;
  int w = 80;
  int h = 50;

  Bird() {
    x = width;
    y = height - 2*h - 30;
  }

  void show(boolean day) {
    if (day == true) {
      image(imgBird, x, y, w, h);
    } else {
      image(imgBird2, x, y, w, h);
    }
  }

  void update() {
    x -= buffer;
    if (x < -w) {
      x = -w-1;
    }
  }
}
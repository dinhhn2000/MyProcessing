class Tree {
  int x;
  int y;
  int w = 40;
  int h = 60;

  Tree() {
    x = width;
    y = height - h - 30;
  }

  void show(boolean day) {
    if (day == true) {
      image(imgTree, x, y, w, h);
    } else {
      image(imgTree2, x, y, w, h);
    }
  }

  void update() {
    x -= buffer;
    if (x < -w) {
      x = -w-1;
    }
  }
}
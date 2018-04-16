class Firework {
  Particle firework; 
  boolean exploded = false;
  Particle[] exploding = new Particle[100];
  int lifespan = (int)random(frameRate*10, frameRate*15);
  int time = 0;
  int fade = 255;

  int red;
  int green;
  int blue;

  Firework() {
    firework = new Particle((int)random(width), height, false);
    //firework = new Particle((int)random(-width/2, width/2), height, (int)random(-300, 300), false);
    red = (int)random(255);
    green = (int)random(255);
    blue = (int)random(255);
  }

  void explode() {
    fade = 255;
    for (int i=0; i<exploding.length; i++) {
      exploding[i] = new Particle((int)firework.pos.x, (int)firework.pos.y, exploded);
      //exploding[i] = new Particle((int)firework.pos.x, (int)firework.pos.y, (int)firework.pos.z, exploded);
    }
  }

  void update() {
    if (firework != null) {
      fade--;
      firework.gravityAffect(gravity);
      firework.update(true);
      if (firework.velocity.y >= 0) {
        exploded = true;
        explode();
        firework = null;
      }
      return;
    }

    for (int i=0; i<exploding.length; i++) {
      exploding[i].update(false);
      exploding[i].gravityAffect(gravity);
    }
    time++;
    fade-=4;
    if (time == lifespan) {
      firework = new Particle((int)random(width), height, false);
      //firework = new Particle((int)random(-width/2, width/2), height, (int)random(-300, 300), false);
      exploded = false;
      time = 0;
      fade = 255;
      red = (int)random(255);
      green = (int)random(255);
      blue = (int)random(255);

      for (int i=0; i<exploding.length; i++) {
        exploding[i] = null;
      }
    }
  }

  void show() {
    if (firework != null) {
      firework.show(red, green, blue, fade, true);
    }
    for (int i=0; i<exploding.length; i++) {
      if (exploding[i] == null) {
        break;
      }
      exploding[i].show(red, green, blue, fade, false);
    }
  }
}    
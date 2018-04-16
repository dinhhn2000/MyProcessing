class Particle {
  PVector pos;
  PVector velocity;
  PVector accelerate;


  Particle(int x, int y, boolean exploded)    
  //Particle(int x, int y, int z, boolean exploded) 
  {
    pos = new PVector(x, y);
    //pos = new PVector(x, y,z);
    if (exploded == false) {
      //velocity = new PVector(0, random(-8, -6));
      velocity = new PVector(0, random(-15, -10), random(-10, 10));
    } else {
      //velocity = PVector.random2D();
      velocity = PVector.random3D();
      velocity.mult(random(4, 8));
    }
    accelerate = new PVector(0, 0);
  }


  void gravityAffect(PVector gravity) {
    accelerate.add(gravity);
  }

  void update(boolean firework) {
    if (!firework) {
      velocity.mult(0.98);
    }
    velocity.add(accelerate);
    pos.add(velocity);
    accelerate.mult(0);
  }

  void show(int red, int green, int blue, int fade, boolean firework) {
    if (firework) {
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
    stroke(red, green, blue, fade);
    //point(pos.x, pos.y);
    
    pushMatrix();
     translate(pos.x, pos.y, pos.z);
     point(0, 0);
     popMatrix();
     
  }
}
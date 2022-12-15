class Flake {
  int fS;
  int x, y;
  color c;
  boolean stuck, ended;
  Flake() {
    fS = 15;
    x = width/2;
    y = 0;
    //c = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
    c = color((int) (Math.random() * 255)+220, (int) (Math.random() * 255)+220, (int) (Math.random() * 255)+220,(int) (Math.random() * 255)+100);
    stuck = false;
    ended = false;
  }
  void move() {
    x += -2;
    y += (int)((Math.random() * 13)) - 6;
  }
  void show() {
    fill(c);
    ellipse(x, y, fS, fS);
  }
  boolean isStuck() { //we need to use the method at some point
    for (Flake f : mySnowflake) {
      if (this != f) {
        if (dist(x, y, f.x, f.y) <= fS) {
          //if we're inside this loop then we have collided
          stuck = true;
          ended = true;
        }
      }
    }
    return stuck;
  }
  boolean isEnded() {
    if (x <= fS/2) {
      ended = true;
      stuck = true;
    }
    return ended;
  }
  boolean update() {
    return isStuck() || isEnded();
  }
}

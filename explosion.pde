class Explosion {
  PVector position;
  boolean alive = true;
  int time;
  int duration = 200;
  
  Explosion(float x, float y) {
    time = millis();
    position = new PVector(x, y);
  }
  
  void update() {
    if (alive && millis() > time + duration) alive = false;
  }
  
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    popMatrix();
    noStroke();
    fill(255, 255, 0);
    float sizeVal = 100 + random(-50, 50);
    ellipse(position.x, position.y, sizeVal, sizeVal);
  }
  
  void run() {
    update();
    draw();
  }
}

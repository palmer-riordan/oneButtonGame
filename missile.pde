class missile {
  PVector position;
  float rot;
  int time;
  float speed = 10;
  boolean alive = true;
  int duration = 1000;

  missile(float x, float y, float _rot) {
    position = new PVector(x, y);
    rot = _rot;
    time = millis();
  }
   
  void update() {
    // https://www.emanueleferonato.com/2007/04/28/create-a-flash-artillery-game-step-1/
    position.x += speed * sin(radians(rot));
    position.y -= speed * cos(radians(rot));
    if (alive && millis() > time + duration) alive = false;
  }
  
  void draw() {
    stroke(255);
    ellipse(position.x, position.y, 10, 10);
  }
  
  void run() {
    update();
    draw();  
  }
}

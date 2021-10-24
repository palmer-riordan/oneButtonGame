class Ship {
  float angle;
  PVector position;
  float rot = 0;
  float rotDelta = 2;
  ArrayList<missile> missiles;
 
  Ship(float x, float y) {
    position = new PVector(x, y);
    missiles = new ArrayList<missile>();
  }
  
  void update() {
     
    if(mousePressed)rot = mouseX;//Ship rotates when mouse is clicked
 
    for (int i=missiles.size()-1; i>=0; i--) {
      missile miss = missiles.get(i);
      if (miss.alive) {
        miss.run();
      } else {
        missiles.remove(i);
      }
    }
  }

  void draw() {
    fill(255);
    stroke(0);
    pushMatrix(); 
    translate(position.x, position.y);
    rotate(radians(rot));//rotates ship
    triangle(0,0, -20, 20, 20,20);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }
  void fire() {
    missiles.add(new missile(position.x, position.y, rot));
  }
}

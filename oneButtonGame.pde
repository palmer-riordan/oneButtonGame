// For my one button game I created something similar to the old arcade game Asteroids
// The user only needs to use the mouse, holding down to rotate ship and clicking to fire
Ship ship;
ArrayList<aliens> enemies;
ArrayList<Explosion> explosions;
int spawnRate = 1000;
int markTime = 0;
boolean debug = true;
boolean start = true;

void setup() {
  size(800, 600, P2D);
  ship = new Ship(width/2, height/2);
  enemies = new ArrayList<aliens>();
  explosions = new ArrayList<Explosion>();
  surface.setTitle("ALIENS ATTACK!");
}

void draw() {
  if(start == true) {//Title Screen
    background(0);
    textSize(50);
    fill(255);
    text("ALIENS ATTACK!", width/4, height/2);
    textSize(25);
    text("CLICK TO START", width/4 + 100, height/2 + 75);
    if(mousePressed) {
      start = false;
    }
  }
  
  else {
  background(0);
  int t = millis();
  //spawn new aliens
  if (t > markTime + spawnRate) {
    enemies.add(new aliens());
    markTime = t;
  }
  ship.run();
  //remove destroyed aliens
  for (int i=enemies.size()-1; i>=0; i--) {
    aliens alien = enemies.get(i);
    if (alien.alive) {
      alien.run();
    } else {
      enemies.remove(i);
    }
  }
  
  for (int i=explosions.size()-1; i>=0; i--) {
    Explosion explosion = explosions.get(i);
    
    if (explosion.alive) {
      explosion.run();
    } else {
      explosions.remove(i);
    }
  }
 }
}
//Hit detection borrowed from Week 7 artillery
boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}

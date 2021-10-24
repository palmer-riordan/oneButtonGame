class aliens {
  PVector position, target;
  PImage gameOver;
  float moveSpeed = 0.0001;
  float xDif = 500;
  float yDif = 150;
  boolean alive = true;
  int counter = 0;
  PVector alienSize = new PVector(40, 40);
  float x1;
  float y1;
  float x2 = width/2;
  float y2 = height/2;
  
  aliens() {
    //Choose random location for alien to spawn
    int pickStart = int(random(0,12));
    if (pickStart == 1) {
      
      x1 = 700;
      y1 = 0;
      
    } else if(pickStart == 2){
      
      x1 = 800;
      y1 = 100;
      
    }
    else if(pickStart == 3){
      
      x1 = 800;
      y1 = 300;
      
    }
    else if(pickStart == 4){
      
      x1 = 800;
      y1 = 700;
      
    }
    else if(pickStart == 5){
      
      x1 = 700;
      y1 = 600;
      
    }
    else if(pickStart == 6){
      
      x1 = 400;
      y1 = 600;
      
    }
    else if(pickStart == 7){
      
      x1 = 200;
      y1 = 600;
      
    }
    else if(pickStart == 8){
      
      x1 = 0;
      y1 = 600;
      
    }
    else if(pickStart == 9){
      
      x1 = 0;
      y1 = 300;
      
    }
    else if(pickStart == 10){
      
      x1 = 0;
      y1 = 200;
      
    }
    else if(pickStart == 11){
      
      x1 = 200;
      y1 = 0;
      
    }
    else if(pickStart == 12){
      
      x1 = 400;
      y1 = 0;
      
    }
    position = new PVector(x1, y1);
    //Move speed to increase for each alien
    moveSpeed += 0.01;
    target = new PVector(x2, y2);  
  }
  
  void update() {
    if (position.dist(target) < 5) alive = false;
    for (missile miss : ship.missiles) {
      if (alive && hitDetectRect(position, miss.position, alienSize)) {
        alive = false;
        //Supposed to read how many aliens the player has hit but counter doesn't seem to go up
        counter += 1;
        println("Aliens Vanquished: " + counter);
        explosions.add(new Explosion(position.x, position.y));
      }
    }
    if (alive) position.lerp(target, moveSpeed);
  }
  
  void draw() {
    fill(0);
    stroke(255,255,255);
    ellipse(position.x, position.y, alienSize.x, alienSize.y);
    if (debug) {
      int col = int(random(1,255));//Creates flashing effects on aliens
      fill(col);
      noStroke();
      ellipse(position.x, position.y, 10, 10);
    }
    
    if(((position.x < width/2 + 5) && (position.x > width/2 -5)) && ((position.y > height/2 -5) && (position.y < height/2+5))) {//Game ends if alien gets too close to player
      println("GAME OVER");
      println(" Your score: " + counter);//Again, would display score if counter worked properly
      delay(5000);
      exit();
  }
}
  
  void run() {
    update();
    draw();
  }
}

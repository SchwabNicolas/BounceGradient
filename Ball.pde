class Ball {
  PVector coords;
  PVector velocity;
  
  color ballColor;
  int alpha;
  int ballSize;
  
  Ball() {
    coords = new PVector(mouseX,mouseY);
    velocity = new PVector(random(-2,2),random(-2,2));
    
    alpha = 255;
    ballColor = color((int)random(0,255),(int)random(0,255),(int)random(0,255));
    ballSize = (int)random(30,75);
  }
  
  Ball(color ballColor) {
    coords = new PVector(mouseX,mouseY);
    velocity = new PVector(random(-2,2),random(-2,2));
    
    alpha = 255;
    this.ballColor = ballColor;
    ballSize = (int)random(30,75);
  }
  
  Ball(color ballColor,PVector coords) {
    this.coords = coords;
    velocity = new PVector(random(-2,2),random(-2,2));
    
    alpha = 255;
    this.ballColor = ballColor;
    ballSize = (int)random(30,75);
  }
  
  void display() {
    fill(red(ballColor),green(ballColor),blue(ballColor),alpha);
    ellipse(coords.x,coords.y,ballSize,ballSize);
  }
  
  void move() {
    coords.add(velocity);
  }
  
  void checkBoundaries() {
    if(coords.x <= 0+ballSize/2) {
      coords.x = ballSize/2;
      velocity.x *= -1;
    }
    
    if(coords.y <= 0+ballSize/2) {
      coords.y = ballSize/2;
      velocity.y *= -1;
    }
    
    if(coords.x >= width-ballSize/2) {
      coords.x = width-ballSize/2;
      velocity.x *= -1;
    }
    
    if(coords.y >= height-ballSize/2) {
      coords.y = height-ballSize/2;
      velocity.y *= -1;
    }
  }
  
  void updateAlpha() {
    alpha--;
  }
  
  int getAlpha() {
    return alpha;
  }
}
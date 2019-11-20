import java.util.ListIterator;

ArrayList<Ball> balls = new ArrayList();

int rouge = 0;
int vert = 0;
int bleu = 0;
boolean rougeB = true;
boolean vertB = false;
boolean bleuB = false;

void setup() {
  size(800, 800);
  noStroke();
  textAlign(CENTER);
  textSize(40);
}

void draw() {
  background(255);

  if (mousePressed && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    balls.add(new Ball(degraday()));
  }

  for (Ball ball : balls) {
    ball.move();
    ball.checkBoundaries();
    ball.display();
    ball.updateAlpha();
  }
  removeBalls();
  degraday();
  fill(0);
  text(balls.size(), width/2, height/2);
}

void removeBalls() {
  ListIterator<Ball> iter = balls.listIterator();
  while (iter.hasNext()) {
    if (iter.next().getAlpha() <= 0) {
      iter.remove();
    }
  }
}

color degraday() {
  if (rougeB == true) {
    rouge += 1;
    if (rouge >= 255) {
      rouge = 255;
    }
  }
  if (rougeB == false) {
    rouge -= 1;
    if (rouge <= 0) {
      rouge = 0;
    }
  }

  if (vertB == true) {
    vert += 1;
    if (vert >= 255) {
      vert = 255;
    }
  }
  if (vertB == false) {
    vert -= 1;
    if (vert <= 0) {
      vert = 0;
    }
  }

  if (bleuB == true) {
    bleu += 1;
    if (vert >= 255) {
      bleu = 255;
    }
  }
  if (bleuB == false) {
    bleu -= 1;
    if (bleu <= 0) {
      bleu = 0;
    }
  }

  if (rouge >= 255) {
    rougeB = false;
    vertB = true;
  }

  if (vert >= 255) {
    vertB = false; 
    bleuB = true;
  }

  if (bleu >= 255) {
    bleuB = false;
    rougeB = true;
  }
  
  return color(rouge,vert,bleu);
}
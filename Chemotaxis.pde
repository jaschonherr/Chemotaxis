Walker[] walkers = new Walker[1000];
Food food = new Food();
int foodXR = 0;
int foodYR = 0;
int foodXG = 0;
int foodYG = 0;
int foodXB = 0;
int foodYB = 0;

void setup() {
  size(1200, 700);
  for(int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker((int)(Math.random()*width), (int)(Math.random()*height), color(0, 0, 0));
    walkers[i].roll();
  }
}

void draw() {
  fill(200, 200, 200, 30);
  rect(0, 0, width, height);
  food.show();
  for(int i = 0; i < walkers.length; i++) {
    walkers[i].move();
    walkers[i].show();
  }
}

void keyReleased() {
  if(key == 'r' || key == 'R') {
    foodXR = mouseX;
    foodYR = mouseY;
  }
  if(key == 'g' || key == 'G') {
    foodXG = mouseX;
    foodYG = mouseY;
  }
  if(key == 'b' || key == 'B') {
    foodXB = mouseX;
    foodYB = mouseY;
  }
  if(key == 'q' || key == 'Q') {
    for(int i = 0; i < walkers.length; i++) {
      walkers[i].reset();
    }
  }
  if(key == 'w' || key == 'W') {
    food.reset();
  }
}
class Food {

  void show() {
    if(foodXR > 0 && foodYR > 0) {
      fill(255, 0, 0);
      ellipse(foodXR, foodYR, 20, 20);
    }
    if(foodXG > 0 && foodYG > 0) {
      fill(0, 255, 0);
      ellipse(foodXG, foodYG, 20, 20);
    }
    
    if(foodXB > 0 && foodYB > 0) {
      fill(0, 0, 255);
      ellipse(foodXB, foodYB, 20, 20);
    } 
  }
  
  void reset() {
    foodXR = 0;
    foodYR = 0;
    foodXG = 0;
    foodYG = 0;
    foodXB = 0;
    foodYB = 0;
  }
}
class Walker {
  
  int myX;
  int myY;
  float r = (float)(Math.random()*156+100);
  float g = (float)(Math.random()*156+100);
  float b = (float)(Math.random()*156+100);
  color myColor;
  int col = (int)(Math.random()*3);
  Walker(int x, int y, int c){
    myX = x;
    myY = y;
    myColor = c;
  }
  
  void roll() { 
    if(col == 0) {
      myColor = color(r, 0, 0);
    } else if(col == 1) {
      myColor = color(0, g, 0);
    } else {
      myColor = color(0, 0, b);
    }
  }
  
  void move() {
    if(col == 0) {
      if(foodXR > 0 && foodYR > 0) {
        if(r >= 100) {
          if(myX < foodXR) {
            myX += (Math.random()*11) - 4;
          } else {
            myX += (Math.random()*11) - 6;
          }
          
          if(myY < foodYR) {
            myY += (Math.random()*11) - 4;
          } else {
            myY += (Math.random()*11) - 6;
          }
        } else {
          myX += (Math.random()*11) - 5;
          myY += (Math.random()*11) - 5;
        }
      } else {
        myX += (Math.random()*11) - 5;
        myY += (Math.random()*11) - 5;
      }  
    }
    
    if(col == 1) {
      if(foodXG > 0 && foodYG > 0) {
        if(g >= 100) {
          if(myX < foodXG) {
            myX += (Math.random()*11) - 4;
          } else {
            myX += (Math.random()*11) - 6;
          }
          
          if(myY < foodYG) {
            myY += (Math.random()*11) - 4;
          } else {
            myY += (Math.random()*11) - 6;
          }
        } else {
          myX += (Math.random()*11) - 5;
          myY += (Math.random()*11) - 5;
        }
      } else {
        myX += (Math.random()*11) - 5;
        myY += (Math.random()*11) - 5;
      }  
    }
    
    if(col == 2) {
      if(foodXB > 0 && foodYB > 0) {
        if(b >= 100) {
          if(myX < foodXB) {
            myX += (Math.random()*11) - 4;
          } else {
            myX += (Math.random()*11) - 6;
          }
          
          if(myY < foodYB) {
            myY += (Math.random()*11) - 4;
          } else {
            myY += (Math.random()*11) - 6;
          }
        } else {
          myX += (Math.random()*11) - 5;
          myY += (Math.random()*11) - 5;
        }
      } else {
        myX += (Math.random()*11) - 5;
        myY += (Math.random()*11) - 5;
      }  
    }
  }
  
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, 10, 10);
  }
  
  void reset() {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }

}

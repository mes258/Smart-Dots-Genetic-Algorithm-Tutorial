Population test;
PVector goal  = new PVector(400, 10);
Walls walls;

int generation = 1;
void setup() {
  size(800, 800); //size of the window
  frameRate(200);//increase this to make the dots go faster
  test = new Population(2000);//create a new population with 1000 members
  walls = new Walls(50);
}

  int index = 0;
void draw() { 
  background(255);

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  walls.showWalls();
  walls.showDotsKilled();
  text("generation: " +generation, 10, 10);
  walls.showTotalKilled();
  
  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
    generation++;
    walls.updateEndOfRound(generation);
  } else {
    //if any of the dots are still alive then update and then show them
    
    for(int i = 0; i < test.dots.length; i++){
      if(walls.checkIfHit(test.dots[i])){
        test.dots[i].dead = true;
      }
    }
    test.update();
    test.show();
  }
}

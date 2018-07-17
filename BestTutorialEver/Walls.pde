class Walls {
  Wall[] walls;
  float totalKilled = 0;
  float killedThisGen = 0;
  float averagePerRound = 0;
  float generation = 1;
  
  Walls(int number) {
    Wall temp = new Wall(0,0,0,0);
    walls = new Wall[number];
    for(int i = 0; i< number; i++){
      float x, y, w, h;
      x = random(50, 700);
      y = random(50, 600);
      float tall = random(2);
      if(tall > 1){
        w = random(30, 35);
        h = random(50, 200);
      }else{
        w = random(50, 200);
        h = random(14, 20);
      }
      
      temp = new Wall(x, y, w, h);
      
      
      walls[i] = temp;
    }
  }
  
  boolean valueInRange(float value, float min, float max){ 
    return (value >= min) && (value <= max); 
  }
  
  boolean wallsOverlap(Wall w1, Wall w2){
    boolean xOverlap = valueInRange(w1.x, w2.x, w2.x + w2.w) ||
                    valueInRange(w2.x, w1.x, w1.x + w1.w);
                    
    boolean yOverlap = valueInRange(w1.y, w2.y, w2.y + w2.h) ||
                    valueInRange(w2.y, w1.y, w1.y + w1.h);

      return xOverlap && yOverlap;
    }
  
  
  boolean checkIfHit(Dot d){
    boolean hit = false;
    for(int i = 0; i < walls.length; i++){
      if(hitWall(d, i)){
        hit = true;
      }
    }
    return hit;
  }
  
  void updateEndOfRound(float gen){
    generation = gen;
    if(killedThisGen == 0){
      println("YOU WIN!");
    }
    killedThisGen = 0;
 
  }
  
  void showTotalKilled(){
    text("Total Dots Killed so far: " + totalKilled, 10, 30);
    text("Total Dots Killed this Round: " + killedThisGen, 10, 50);
    text("Average Dots Killed per Round: " + totalKilled/generation, 10, 70);
  }
  
   
  
  
  //x,y,w,h
  //0, 300, 600, 10
  boolean hitWall(Dot d, int i){
    Wall w = walls[i];
    float dx = d.pos.x;
    float dy = d.pos.y;
    if (d.dead == false){
      if(dx > w.x-2 && dx < w.x+w.w+2 && dy > w.y-2 && dy < w.y+w.h+2){
        walls[i].totalDotsKilled++;
        totalKilled++;
        killedThisGen++;
        if(walls[i].totalDotsKilled >= 1000){
          walls[i].x = random(50,700); 
          walls[i].y = random(50,600);
          walls[i].totalDotsKilled = 0;
        }
        return true;
      }
    }
    return false;
  }
  
  void showWalls(){
    for(int i = 0; i < walls.length; i++){
      walls[i].show();
    }
  }
  
  void showDotsKilled(){
    for(int i = 0; i< walls.length; i++){
      if(walls[i].totalDotsKilled != 0){
        if((walls[i].totalDotsKilled % 10)/10 > walls[i].w){
          walls[i].w += 10;
        }
        fill(255,0,0);
        text(walls[i].totalDotsKilled, walls[i].x + 2, walls[i].y + 12);
      }
    }
  }
    


  //-----------------------------------------------------------------------------------------------------------------
  //draws the dot on the screen
//  void show() {
//    //if this dot is the best dot from the previous generation then draw it as a big green dot
//    if (isBest) {
//      fill(0, 255, 0);
//      ellipse(pos.x, pos.y, 8, 8);
//    } else {//all other dots are just smaller black dots
//      fill(0);
//      ellipse(pos.x, pos.y, 4, 4);
//    }
//  }

}

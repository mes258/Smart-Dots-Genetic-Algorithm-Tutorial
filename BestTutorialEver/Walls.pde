class Walls {
  Wall[] walls;
  
  Walls(int number) {
    walls = new Wall[number];
    for(int i = 0; i< number; i++){
      float x, y, w, h;
      x = random(800);
      y = random(500);
      w = random(50, 300);
      h = random(10, 20);
      
      walls[i] = new Wall(x, y, w, h);
    }
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
  //x,y,w,h
  //0, 300, 600, 10
  boolean hitWall(Dot d, int i){
    Wall w = walls[i];
    float dx = d.pos.x;
    float dy = d.pos.y;
    if (d.dead == false){
      if(dx > w.x-2 && dx < w.x+w.w+2 && dy > w.y-2 && dy < w.y+w.h+2){
        walls[i].totalDotsKilled++;
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
      text("Total Dots Killed: " + walls[i].totalDotsKilled, walls[i].x + 10, walls[i].y - 10);
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

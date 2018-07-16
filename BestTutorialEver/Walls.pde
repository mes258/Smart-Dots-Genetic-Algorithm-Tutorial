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
      if(hitWall(d, walls[i])){
        hit = true;
      }
    }
    return hit;
  }
  
  boolean hitWall(Dot d, Wall w){
    if(d.pos.x < w.x && d.pos.y < w.y && d.pos.x > w.h && d.pos.y > w.w){
      return true;
    }
    return false;
  }
  
  void showWalls(){
    for(int i = 0; i < walls.length; i++){
      walls[i].show();
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

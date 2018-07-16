class Wall {
  
  public float x, y, h, w;
  Wall(float x, float y, float h, float w) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }
  
  void show(){
    fill(0, 0, 255);
    rect(x, y, h, w);
  }
  
  
  
  
}

class RegionSelector
{
  float x, y;
  
  public RegionSelector(float x_, float y_)
  {
    x = x_;
    y = y_;
  }
  
  void update()
  {
    if(mousePressed == true)
    {
      if(mouseButton == RIGHT)
      {
        x = mouseX;
        y = mouseY;
      }
    }
  }
  
  void display()
  {
    stroke(255, 255, 255);
    strokeWeight(0.3);
    
    /* Vertical */
    line(x, 0, x, height);
    
    /* horizontal*/
    line(0, y, width, y);
    
    noStroke();
  }
  
  float getLongitude()
  {
    return x;
  }
  
  float getLatitude()
  {
    return y;
  }
}

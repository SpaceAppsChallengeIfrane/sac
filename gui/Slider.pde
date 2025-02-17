class Slider 
{
  float swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  Slider (float xp, float yp, float sw, float sh, int l)
  {
    swidth = sw;
    sheight = sh;
    float widthtoheight = sw - sh;
    ratio = (float) sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update()
  {
    if (overEvent())
    {
      over = true;
    }
    else
    {
      over = false;
    }
    if (mousePressed && (mouseButton == LEFT) && over)
    {
      locked = true;
    }
    if (!mousePressed)
    {
      locked = false;
    }
    if (locked)
    {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1)
    {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv)
  {
    return min(max(val, minv), maxv);
  }

  boolean overEvent()
  {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void display()
  {
    noStroke();
    fill(100, 200, 200);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked)
    {
      fill(50, 80, 20);
    } 
    else 
    {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
    fill(0);
    textAlign(CENTER);
    textSize(8);
    text(Integer.toString(ceil(getPos())), xpos, ypos, swidth, sheight);
  }

  float getPos()
  {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return (spos - xpos) * ratio;
  }
}

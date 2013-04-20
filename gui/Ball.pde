class Ball
{
  String brief = "";
  String description = "";
  PImage img = null;
  boolean drag = false;
  float angle = 0;
  color c;
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  
  boolean overCircle(float x, float y, float diameter)
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
 
  Ball(color col, float xin, float yin, float din, int idin, Ball[] oin)
  {
    c = col;
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    vx = random(255) % 3;
    vy = random(100) % 3;
  } 
  
  void collide()
  {
    for (int i = id + 1; i < numBalls; i++)
    {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist)
      { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move()
  {
 //   vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width)
    
    {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0)
    {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height)
    {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0)
    {
      y = diameter/2;
      vy *= friction; 
    } 
  }
  
  void display()
  {
    if(mousePressed == true && ! overCircle(x, y, diameter))
    {
      float r = 150;
      if(sq(x - mouseX) + sq(y - mouseY) < sq(r))
      {
        if(x > mouseX)
        {
          vx += 0.3;
          x += 10;
        }
        else
        {
          vx -= 0.3;
          x -= 10;
        }
        
        if(y > mouseY)
        {
          vy += 0.3;
          y += 10;
        }
        else
        {
          vy -= 0.3;
          y -= 10;
        }
      }
    }
    
    if(overCircle(x, y, diameter))
    {
      if(mousePressed == true)
      {
        drag = true;
        
        /* Display image */
        if(img == null)
        {
          img = loadImage("http://eol.jsc.nasa.gov/sseop/images/ISD/lowres/AS07/AS07-11-2013.JPG", "jpg");
          img.resize(100, 100);
        }
        if(x + 115 < width)
        {
          fill(c);
          textAlign(LEFT);
          text(description, x + 15, y); 
          image(img, x + 15, y - 140);
        }
        else
        {
          image(img, x - 115, y - 140);
          fill(c);
          textAlign(LEFT);
          text(description,  x - 115, y); 
        }
      }
      else
      {
        drag = false;
      }
      color ctransparent = color(red(c), green(c), blue(c), 50);
      fill(ctransparent);
      ellipse(x, y, diameter + 10, diameter + 10);
      
      stroke(c);
      if(x + 115 < width)
      {
        line(x, y, x + 15, y - 20);
        line(x + 15, y - 20, x + 115, y - 20);
        fill(c);
        text(brief, x + 15, y - 25);
      }
      else
      {
        line(x, y, x - 15, y - 20);
        line(x - 15, y - 20, x - 115, y - 20);
        fill(c);
        text(brief, x - 115, y - 25);
      }
      noStroke();
    }
    
    if(mousePressed == false)
    {
      drag = false;
    }
    else
    
    if(drag)
    {
      x = mouseX;
      y = mouseY;
      vx = 0;
      vy = 0;
    }
    
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
  
  void setDescription(String description_)
  {
    description = description_;
  }
  
  void setBrief(String brief_)
  {
    brief = brief_;
  }
}


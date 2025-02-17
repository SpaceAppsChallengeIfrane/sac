int count;
class Ball
{
  Picture pic;
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
    vx = random(-1,1)*5;
    vy = random(-1,1)*5;
    pic = new Picture();
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
    
    if (mousePressed == false){
    
      float r = 50;
      if(sq(x - mouseX) + sq(y - mouseY) < sq(r)){
       count++;
       if (count>20) count=20;
       if (count<=20){
        if(x > mouseX)
        {
          vx = - 0.1;
          
           if (vx <= 0 ){
            vx= 0;            
           }
           if (x < mouseX + 40){
             vx=0;
           }
        }
        else
        {
          vx = 0.1; 
          
          if (vx <= 0 ){
            vx =  0.1*mouseX;
         } 
         if (x > mouseX - 40){
             vx=0;
           }
        }
        
        if(y > mouseY)
        {
          vy = - 0.1;
          
          if (vy <= 0 ){
            vy= 0;
          }
          if (y < mouseY + 40){
             vy= 0;
           }
        }
        else
        {
          vy = 0.1;
          
           if (vy <= 0 ){
            vy=0.1*mouseY;
           }
           if (y > mouseY + 40){
            vy= 0;
           }
        }
       }
        
        if(abs(mouseX-pmouseX)>50 && abs(mouseY-pmouseY)>50){
          count=0;
        }
      }
    
    }
    if(mousePressed == true && ! overCircle(x, y, diameter))
    {
      float r = 300;
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
        if(pic.img == null)
        {
          pic= db.fetch();
          pic.img.resize(200, 200);
        }
        if(x + 115 < width)
        {
          fill(c);
          textAlign(LEFT);
          text(pic.feat, x + 15, y);
          text(pic.geon, x + 15, y-25);
          text("LONG: "+pic.lon+"", x + 15, y + 15);
          text("LAT: "+pic.lat+"", x + 15, y + 30);
          image(pic.img, x + 15, y - 240);
          stroke(c);
          line(x, y, x + 15, y - 20);
          line(x + 15, y - 20, x + 115, y - 20);
          noStroke();
        }
        else
        {
          image(pic.img, x - 115, y - 240);
          fill(c);
          textAlign(RIGHT);
          text(pic.feat,  x - 115, y); 
          text(pic.geon, x -115, y-25);
          text("LONG: "+pic.lon+"", x - 115, y + 15);
          text("LAT: "+pic.lat+"", x - 115, y +30);
          stroke(c);
          line(x, y, x - 15, y - 20);
          line(x - 15, y - 20, x - 115, y - 20);
          noStroke();
        }
          
        
      }
      else
      {
        drag = false;
      }
      color ctransparent = color(0,255,255, 90);
      fill(ctransparent);
      ellipse(x, y, diameter + 10, diameter + 10);
      
      stroke(c);
      if(x + 115 < width)
      {
//        line(x, y, x + 15, y - 20);
//        line(x + 15, y - 20, x + 115, y - 20);
        fill(c);
//        text(pic.geon, x + 15, y - 25);
      }
      else
      {
//        line(x, y, x - 15, y - 20);
//        line(x - 15, y - 20, x - 115, y - 20);
        fill(c);
//        text(pic.geon, x - 115, y - 25);
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
  

}


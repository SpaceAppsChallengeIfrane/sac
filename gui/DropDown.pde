class DropDown
{
  String title;
  String[] items;
  
  String last_selected_item = "";
  
  boolean overRect(float x, float y, float width, float height)
  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public DropDown(String title_, String[] items_)
  {
    title = title_;
    items = items_;
  }
  
  public void display(float x, float y)
  {
    float ycoord = y;
    float w = 100;
    float h = 20;
    
    textAlign(CENTER);
    textSize(14);
    fill(255, 52, 100, 50);
    rect(x, ycoord, w, h);
    fill(255, 255, 255);
    text(title, x, ycoord, w, h);
    ycoord += h + 2;
    
    for(int i = 0; i < items.length; i ++)
    {
      if(overRect(x, ycoord, w, h))
      {
        fill(255, 255, 255, 50);
        
        if(mousePressed == true)
        {
          last_selected_item = items [i];
        }
      }
      else
      {
        fill(255, 52, 100, 50);
      }
      rect(x, ycoord, w, h);
      fill(255, 255, 255);
      text(items [i], x, ycoord, w, h);
      ycoord += h;
    }
  }
}

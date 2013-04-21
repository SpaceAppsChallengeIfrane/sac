final int CHAOS_VIEW = 0;
final int MAP_VIEW = 1;
int view = MAP_VIEW; // Default
int numBalls = 750;
float spring = 0.05;
float gravity = 0.05;
float friction = -0.59;
Ball[] balls = new Ball[numBalls];
RegionSelector rs;
Slider s;

void setup() {
  size(640, 480);
  frame.setResizable(true);
  for (int i = 0; i < numBalls; i++)
  {
    color c = color(random(255), random(255), random(255));
    balls[i] = new Ball(c, random(width), random(height), random(30, 70) % 15, i, balls);
    balls[i].setDescription("Desciption");
    balls[i].setBrief("Brief");
  }
  noStroke();
  textSize(14);
  
  s = new Slider(100, 100, 100, 10, 5);
  rs = new RegionSelector(width / 2, height / 2);
}

void draw()
{
  background(0);
  switch(view)
  {
    default: break;
    case CHAOS_VIEW:
      break;
     case MAP_VIEW:
      rs.update();
      rs.display();
      break;
  }
  /*
  for(int i = 0; i < numBalls; ++ i)
  {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
  s.update();
  s.display();
  
  String[] items = {"Chaotic Space", "World Map"};
  DropDown dd = new DropDown("Select View", items);
  dd.display(250, 200);
  
  rs.update();
  rs.display();
  */
}

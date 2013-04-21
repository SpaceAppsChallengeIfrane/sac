final int CHAOS_VIEW = 0;
final int MAP_VIEW = 1;
int view = CHAOS_VIEW; // Default
int numBalls = 1000;
float spring = 0.05;
float gravity = 0.05;
float friction = -0.59;
Ball[] balls = new Ball[numBalls];
Slider s = new Slider(100, 100, 100, 10, 5);
RegionSelector rs = new RegionSelector(300, 300);

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
}

void draw()
{
  background(0);
  /*for(int i = 0; i < numBalls; ++ i)
  {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }*/
  s.update();
  s.display();
  
  String[] items = {"Chaotic Space", "World Map"};
  DropDown dd = new DropDown("Select View", items);
  dd.display(250, 200);
  
  rs.update();
  rs.display();
}

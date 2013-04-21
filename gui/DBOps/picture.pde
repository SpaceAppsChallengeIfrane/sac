class Picture{
  
  PImage img;
  String url;
  String geon;
  String feat;
  double lon;
  double lat;
  
  public Picture(){
  }
  
  public Picture(String URL, String geon, String feat, double lon, double lat){
    this.url = URL;
    this.img = loadImage(url);
    this.geon = geon;
    this.feat = feat;
    this.lon = lon;
    this.lat = lat;    
  }
  
  void display(int xpos, int ypos){
     image(this.img, xpos, ypos);
  }
  
}


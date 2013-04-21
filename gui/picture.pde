class Picture{
  
  PImage img = null;
  String url = "url";
  String geon= "geon";
  String feat = "feat";
  double lon = 1.1;
  double lat = 0.0;
  
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
  
}


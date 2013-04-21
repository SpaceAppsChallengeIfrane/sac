import java.util.regex.*;
import java.util.List;
import java.util.Iterator;
import java.net.URLEncoder;

class DBOperations {

  List<String> urls = new ArrayList<String>();
  List<String> geons = new ArrayList<String>();
  List<String> feats = new ArrayList<String>();
  List<String> lons = new ArrayList<String>();
  List<String> lats = new ArrayList<String>();

  List<Picture> pics = new ArrayList<Picture>();

  public DBOperations(){
  }
  
  Picture fetch(){
    String randURL = "http://localhost:27080/test/imgbz/_find?criteria={\"random\":"+int(random(219841))+"}";
    String results = loadStrings(randURL)[0];
    
    String URLpattern = "(http.*?G)";
    String GEONpattern = "\"geon.*?\": \"(.*?)\"";
    String FEATpattern= "\"feat.*?\": \"(.*?)\"";
    String LONpattern = "\"loc.*?\": \\[(.*?),";
    String LATpattern = "\"loc.*?\": \\[.*?,(.*?)\\]";
    
    Pattern pURL = Pattern.compile(URLpattern);
    Pattern pGEON = Pattern.compile(GEONpattern);
    Pattern pFEAT = Pattern.compile(FEATpattern);
    Pattern pLON = Pattern.compile(LONpattern);
    Pattern pLAT = Pattern.compile(LATpattern);
    
    Matcher mURL = pURL.matcher(results);
    Matcher mGEON = pGEON.matcher(results);
    Matcher mFEAT = pFEAT.matcher(results);
    Matcher mLON = pLON.matcher(results);
    Matcher mLAT = pLAT.matcher(results);
    
    Picture newpic = new Picture();
    mURL.find();
    mGEON.find();
    mFEAT.find();
    mLON.find();
    mLAT.find();
    
    newpic.url=mURL.group(1);
    newpic.geon=mGEON.group(1);
    newpic.feat=mFEAT.group(1);
    newpic.lon =Double.parseDouble(mLON.group(1));
    newpic.lat =Double.parseDouble(mLAT.group(1));
    newpic.img = loadImage(newpic.url);
    return newpic;
  }  
   void fetch(String url){
  
    String results = loadStrings(url)[0];
    
    String URLpattern = "(http.*?G)";
    String GEONpattern = "\"geon.*?\": \"(.*?)\"";
    String FEATpattern= "\"feat.*?\": \"(.*?)\"";
    String LONpattern = "\"loc.*?\": \\[(.*?),";
    String LATpattern = "\"loc.*?\": \\[.*?,(.*?)\\]";
    
    Pattern pURL = Pattern.compile(URLpattern);
    Pattern pGEON = Pattern.compile(GEONpattern);
    Pattern pFEAT = Pattern.compile(FEATpattern);
    Pattern pLON = Pattern.compile(LONpattern);
    Pattern pLAT = Pattern.compile(LATpattern);
    
    Matcher mURL = pURL.matcher(results);
    Matcher mGEON = pGEON.matcher(results);
    Matcher mFEAT = pFEAT.matcher(results);
    Matcher mLON = pLON.matcher(results);
    Matcher mLAT = pLAT.matcher(results);
    
    while(mURL.find())
    {
      urls.add(mURL.group(1));
    }
    
    while(mGEON.find())
    {
      geons.add(mGEON.group(1));
    }
    
    while(mFEAT.find())
    {
      feats.add(mFEAT.group(1));
    }
    
    while(mLON.find())
    {
      lons.add(mLON.group(1));
    }
    
    while(mLAT.find())
    {
      lats.add(mLAT.group(1));
    }

  }
}
//
//void setup(){
//
//DBOperations myops = new DBOperations();
//
//myops.fetch("http://localhost:27080/test/imgbz/_find?criteria="+URLEncoder.encode("{\"loc\": {\"$near\": [10.0, 10.0] } }"));
//
//println(myops.urls);
//println(myops.geons);
//println(myops.feats);
//println(myops.lats);
//println(myops.lons);
//
//
//}

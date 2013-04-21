import java.util.regex.*;
import java.util.List;
import java.util.Iterator;

int mynum = int(random(219841));
String theurl = "http://localhost:27080/test/imgbz/_find?criteria={\"random\":"+mynum+"}";

String s = loadStrings(theurl)[0];
List<String> urls = new ArrayList<String>();
String pattern = "(http.*?G)";
Pattern p = Pattern.compile(pattern);
Matcher m = p.matcher(s);

void setup(){
  
println(mynum);  
size(800,600);

while(m.find())
{
  urls.add(m.group(1));
}


}

void draw(){

background(0);
Iterator<String> it = urls.iterator();

while (it.hasNext()){
  String url = it.next();
  PImage img = loadImage(url, "jpg");
  image(img, 0, 0);
}

}



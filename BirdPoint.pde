class BirdPoint{
  
  float activeX;
  float activeY;
  String id;
  String date;
  String time;
  float lat;
  float lon;
  float north;
  float east;
  float alt;
  float speed;
  float course; 
  float distance;
  
  color BirdColor;
  float [][] TRK_points;
  Table table;
  int tablelength;
  int x;
  
  BirdPoint(float activeX, float activeY, String id, String date, String time, float lat, float lon, float north, float east, float alt, float speed, float course, float distance ){
    
    this.activeX = activeX;
    this.activeY = activeY;
    this.id = id;
    this.date = date;
    this.time = time;
    this.lat = lat;
    this.lon = lon;
    this.north = north;
    this.east = east;
    this.alt = alt;
    this.speed = speed;
    this.course = course;
    this.distance = distance;
    //this.BirdColor = BirdColor;
    //this.BirdTrack = BirdTrack;
    //this.TRK_points = TRK_points;  
    
    
  
  }
    
}

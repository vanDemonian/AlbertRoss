class csvParser{
  
  String filename;
  PVector [] BirdTrack;
  float [][] TRK_points;
  Table table;
  int tablelength;
  int x;

  BirdPoint[] BPS;

  
  csvParser(String filename){
    
    this.filename = filename;
    this.BirdTrack = BirdTrack;
    this.TRK_points = TRK_points;
    this.table = table;
    this.tablelength = tablelength;
    this.x = x;
    this.BPS = BPS;
  }
  
  void setTRK_points(){
    
    //loading csv data
    this.table = loadTable(filename, "header");
    tablelength = table.getRowCount();

    //Birds by GPS coords
    PVector[] BirdGPS = new PVector[tablelength];
    //Birds by screen coords
    PVector[] BirdScreen = new PVector[tablelength];
    
    BirdPoint[] BPS = new BirdPoint[tablelength];
    
    this.x = 0;
    for (TableRow row : table.rows()) {
      
        String id = row.getString("ID");
        String date = row.getString("Date");
        String time = row.getString("Time");
        
        float lat = row.getFloat("Latitude");
        float lon = row.getFloat("Longitude");
        float north = row.getFloat("Northing");
        float east = row.getFloat("Easting");
        
        float alt = row.getFloat("Altitude");  
        float speed = row.getFloat("Speed");
        float course = row.getFloat("Course");
        float distance = row.getFloat("Distance");
        
           
        BirdGPS[x] = new PVector(lat,lon);
        activepoint = mercatorMap.getScreenLocation(new PVector(BirdGPS[x].x, BirdGPS[x].y));

        BirdScreen[x] = new PVector(activepoint.x, activepoint.y);
        this.BirdTrack = BirdScreen;
        
        //println(" X=", x, " ActiveX=", activepoint.x, " ActiveY=", activepoint.y, " ID=", id, " date=", date, " time=", time, " lat=", lat, " lon=", lon," north=", north, " east=", east, " alt=", alt, " speed=", speed, "course=", course, "distance=", distance);
        
        BPS[x] = new BirdPoint(activepoint.x, activepoint.y, id, date, time, lat, lon, north, east, alt, speed, course, distance);
        this.BPS = BPS;
     
     
     
        x++;
      }
    
    
    
    
  }
     
  PVector[] getBirdTrack(){
      return this.BirdTrack;
  }
     BirdPoint[] getBirdPoints(){
      return this.BPS;
  }
  
}

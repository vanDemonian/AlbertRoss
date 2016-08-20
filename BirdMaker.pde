class BirdMaker{
  
  String filename;
  PVector [] BirdTrack;
  float [][] TRK_points;
  Table table;
  int tablelength;
  int x;
  
  BirdMaker(String filename){
    
    this.filename = filename;
    this.BirdTrack = BirdTrack;
    this.TRK_points = TRK_points;
    this.table = table;
    this.tablelength = tablelength;
    this.x = x;
    
  }
  
  void setTRK_points(){
    
    //loading csv data
    this.table = loadTable(filename, "header");
    tablelength = table.getRowCount();
    //println(table.getRowCount() + " total rows in table");
    
    PVector[] BirdGPS = new PVector[tablelength];
    PVector[] BirdMAP = new PVector[tablelength];
    
    this.x = 0;
    for (TableRow row : table.rows()) {
        String id = row.getString("ID");
        String date = row.getString("Date");
        String time = row.getString("Time");
        float lat = row.getFloat("Latitude");
        float lon = row.getFloat("Longitude");
        float alt = row.getFloat("Altitude");
        float speed = row.getFloat("Speed");
        float course = row.getFloat("Course");
        
        BirdGPS[x] = new PVector(lat,lon);
        activepoint = mercatorMap.getScreenLocation(new PVector(BirdGPS[x].x, BirdGPS[x].y));
      
        //println(date + " " + activepoint);
        BirdMAP[x] = new PVector(activepoint.x, activepoint.y);
        //println("****************************************************");
        //println(x + "  " + BirdMAP[x]);
        
        this.BirdTrack = BirdMAP;
        
        
        
        x++;
      }
    
    
    
    
  }
     
  PVector[] getBirdTrack(){
      return this.BirdTrack;
  }
    
}

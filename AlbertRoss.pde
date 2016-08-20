PImage tasMapImage;
MercatorMap mercatorMap;

PVector hobart;
PVector launceston;
PVector albatrossIsland;
PVector activepoint; 

int tablelength;

PVector[]BirdGPS;
PVector[]BirdMAP;
PVector[]BirdMAP2;
float[] BirdFIX;

int x=0;
int i;
int v = 0;

String filename1 = "Bird1_2013.csv";
String filename2 = "Master.csv";

csvParser CSV = new csvParser(filename2);

//CSV.setTRK_points();
int num = 250;
float mx[] = new float[num];
float my[] = new float[num];


//Table table;

void setup() {
  size(1920, 1080);
  smooth();
  frameRate(25);
  // Loading exported image
  tasMapImage = loadImage("Albatross_Base_2_139.9731,-42.5334,149.9707,-38.2517.png");
  // Map with dimension and bounding box
  mercatorMap = new MercatorMap(1920, 1080, -38.2517, -42.5334, 139.9731, 149.9707 );

  hobart = mercatorMap.getScreenLocation(new PVector(-42.88, 147.33));
  launceston = mercatorMap.getScreenLocation(new PVector(-41.44, 147.13));
  albatrossIsland = mercatorMap.getScreenLocation(new PVector(-40.38, 144.66));
  filename1 = "Bird1_2013.csv";
  filename2 = "Master.csv";
  
  CSV.setTRK_points();
  CSV.getBirdTrack();
  
}


void draw() {
  image(tasMapImage, 0, 0, width, height);
  stroke(0, 40);
  fill(200, 50, 50, 100);
  


  
  //ellipse(hobart.x, hobart.y, 20, 20);
  //ellipse(launceston.x, launceston.y, 20, 20);
  ellipse(albatrossIsland.x, albatrossIsland.y, 10,10);
  stroke(100,35,22);
  strokeWeight(2);
  smooth();
  noFill();

    
  beginShape();
  ellipse(CSV.BirdTrack[v].x, CSV.BirdTrack[v].y, 5,5);
  println(CSV.BirdTrack[v]);

  

  //v++;


  //for( int v=0 ;v<CSV.BirdTrack.length;v++){
  //  vertex(CSV.BirdTrack[v].x, CSV.BirdTrack[v].y);
  //}
  endShape();
  
  v++;
  
    if(v==CSV.BirdTrack.length){
        v=0;
      }
  
  
  int which = frameCount % num;
  mx[which] = CSV.BirdTrack[v].x;
  my[which] = CSV.BirdTrack[v].y;
  
  for (int i = 0; i < num; i++) {
  // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    fill(200,200,200,150);
    stroke(40,25,130,100);
    ellipse(mx[index], my[index], i/10, i/10);
  }
  saveFrame("Master_ALB_track-######.png");
  

        
}


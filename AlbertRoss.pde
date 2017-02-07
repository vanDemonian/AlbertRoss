PImage tasMapImage;
MercatorMap mercatorMap;
PFont font1;
PFont font2;
PFont font3;

PVector hobart;
PVector launceston;
PVector albatrossIsland;
PVector activepoint; 

int tablelength;

PVector[]BirdGPS;
PVector[]BirdMAP;
PVector[]BirdMAP2;
float[] BirdFIX;

BirdPoint[] BPS;


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
  
  
  font1 = loadFont("Verdana-48.vlw");
  font2 = loadFont("Verdana-24.vlw");
  font3 = loadFont("Verdana-12.vlw");
  textFont(font2, 24);

  hobart = mercatorMap.getScreenLocation(new PVector(-42.88, 147.33));
  launceston = mercatorMap.getScreenLocation(new PVector(-41.44, 147.13));
  albatrossIsland = mercatorMap.getScreenLocation(new PVector(-40.38, 144.66));
  filename1 = "Bird1_2013.csv";
  filename2 = "Master.csv";
  
  CSV.setTRK_points();
  CSV.getBirdTrack();
  CSV.getBirdPoints();

  
}


void draw() {
  image(tasMapImage, 0, 0, width, height);
  stroke(0, 40);
  //fill(200, 50, 50, 100);
  
  //ellipse(hobart.x, hobart.y, 20, 20);
  //ellipse(launceston.x, launceston.y, 20, 20);
  //ellipse(albatrossIsland.x, albatrossIsland.y, 10,10);
  
  //stroke(100,35,22);
  //strokeWeight(2);
  smooth();
  noFill();
  
  textFont(font2, 24);
  stroke(25,25,25);
  fill(125,125,125);
  text("ID", 10, 150);
  text(CSV.BPS[v].id, 200, 150);
  text("Date", 10, 250);
  text(CSV.BPS[v].date, 200, 250);
  text("Time", 10, 350);
  text(CSV.BPS[v].time, 200, 350);
  text("Lat", 10, 450);
  text(CSV.BPS[v].lat, 200, 450);
  text("Lon", 10, 550);
  text(CSV.BPS[v].lon, 200, 550);
  text("Alt", 10, 650);
  text(CSV.BPS[v].alt, 200, 650);
  text("Speed", 10, 750);
  text(CSV.BPS[v].speed, 200, 750);
  text("Course", 10, 850);
  text(CSV.BPS[v].course, 200, 850);
  text("Distance", 10, 950);
  text(CSV.BPS[v].distance, 200, 950);
  fill(65,63,63);
  textFont(font3, 12);
  text("Martin Walch 2017", 10, 1000);
  
  
  
  v++;
  
    if(v==CSV.BirdTrack.length){
        v=0;
      }
  
  
  int which = frameCount % num;

  mx[which] = CSV.BPS[v].activeX;
  my[which] = CSV.BPS[v].activeY;
  
  
  for (int i = 0; i < num; i++) {
  // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    fill(200,200,200,150);
    stroke(40,25,130,100);
    ellipse(mx[index], my[index], i/10, i/10);
  }
  
  fill(200,100,100,150);
  stroke(40,25,130,100);
  ellipse(CSV.BPS[v].activeX, CSV.BPS[v].activeY, 10, 10);
  
  
  
  saveFrame("/Users/pyDev/Documents/Processing/P_2_scripts/AlbertRoss/outputs/Master_ALB_track-######.png");
  

        
}


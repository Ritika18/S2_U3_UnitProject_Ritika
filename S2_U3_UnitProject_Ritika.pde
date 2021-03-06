import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

int numBears = 10;
int numElks = 10;
int numWolves = 10;

KinectTracker tracker;
Kinect kinect;
Animal bear[] = new Animal[numBears];
Animal elk[] = new Animal[numElks];
Animal wolf[] = new Animal[numWolves];
BearButton BB;
ElkButton EB;
WolfButton WB;

PVector track = new PVector();

PVector posBear = new PVector();
PVector posElk = new PVector();
PVector posWolf = new PVector();

PImage bearImg;
PImage elkImg;
PImage wolfImg;
PImage coverImg;

void setup()
{
  fullScreen();

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  
  bearImg = loadImage("bear.png");
  bearImg.resize(100, 0);
  
  elkImg = loadImage("elk.png");
  elkImg.resize(100,0);
  
  wolfImg = loadImage("wolf.png");
  wolfImg.resize(100, 0);
  
  coverImg = loadImage("background.png");
  coverImg.resize(width,height);
  
  for(int i = 0; i< numBears; i++)
  {
    bear[i] = new Animal(new PVector(bearImg.width + 50, bearImg.height + 25), new PVector(2, 2), bearImg);
  }  
  
  for(int i = 0; i< numElks; i++)
  {
    elk[i] = new Animal(new PVector(elkImg.width + 50, elkImg.height + 138), new PVector(2, 2), elkImg);
  } 
  
  for(int i = 0; i< numWolves; i++)
  {
    wolf[i] = new Animal(new PVector(wolfImg.width + 50, wolfImg.height + 300), new PVector(2, 2), wolfImg);
  } 
  
  BB = new BearButton(new PVector(bearImg.width + 50, bearImg.height + 25), bearImg, new PVector(bearImg.width + 50, bearImg.height + 25), false);
  EB = new ElkButton(new PVector(elkImg.width + 50, elkImg.height + 138), elkImg, new PVector(elkImg.width + 50, elkImg.height + 138), false);
  WB = new WolfButton(new PVector(wolfImg.width + 50, wolfImg.height + 300), wolfImg, new PVector(wolfImg.width + 50, wolfImg.height + 300), false);

  
} 

void draw()
{
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  //tracker.display();
  
  imageMode(CORNER);
  image(coverImg,0,0);

  
  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  //ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  //ellipse(v2.x, v2.y, 20, 20);

  // Display some info
  float t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);

  track.x = map(v2.x, 0, kinect.width, 0, width);
  track.y = map(v2.y, 0, kinect.height, 0, height);

  fill(255, 0, 0);
  ellipse(track.x, track.y, 20, 20);
        
  BB.Update();
  EB.Update();
  WB.Update();
  
  for(int i = 0; i< numBears; i++)
  {
    //PVector loc = new PVector(bear[i]._location.x, bear[i]._location.y);
    //PVector loc = new PVector(0,0);
    //bearImg.width + 50, bearImg.height + 25)
   
    //posBear.x = map(bearImg.width, 0, kinect.width, 0, width);
    //posBear.y = map(bearImg.height, 0, kinect.height, 0, height);
        
    imageMode(CENTER);
    //NOT SUPPOSED TO USE THIS -- BUT IT WORKS
    //image(bearImg, posBear.x, posBear.y);
    bear[i].Draw();
    bear[i].Walk();
    imageMode(CORNER);
  }  
  
  for(int i = 0; i< numElks; i++)
  {
    PVector loc = new PVector(0,0);
    
    posElk.x = map(loc.x, 0, kinect.width, 0, width);
    posElk.y = map(loc.y, 0, kinect.height, 0, height);

    imageMode(CENTER);
    //NOT SUPPOSED TO USE THIS -- BUT IT WORKS
    //image(elkImg, posElk.x, posElk.y);
    elk[i].Draw();
    imageMode(CORNER);
  } 
  
  for(int i = 0; i< numWolves; i++)
  {
    PVector loc = new PVector(0,0);
    
    posWolf.x = map(loc.x, 0, kinect.width, 0, width);
    posWolf.y = map(loc.y, 0, kinect.height, 0, height);

    imageMode(CENTER);
    //NOT SUPPOSED TO USE THIS -- BUT IT WORKS
    //image(wolfImg, posWolf.x, posWolf.y);
    wolf[i].Draw();
    imageMode(CORNER);
  } 
}

// Adjust the threshold with key presses
void keyPressed() 
{
  float t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}
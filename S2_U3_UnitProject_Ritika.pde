import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

int numBears = 10;

KinectTracker tracker;
Kinect kinect;
Animal bear[] = new Animal[numBears];

PVector track = new PVector();
PVector pos = new PVector();

PImage animalImg;

void setup()
{
  fullScreen();

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  for(int i = 0; i< numBears; i++)
  {
    bear[i] = new Animal(new PVector(40, kinect.height - 40), new PVector(2, 2), animalImg);
  }
  
  animalImg = loadImage("bear.png");
  animalImg.resize(100, 85);
} 

void draw()
{
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  for(int i = 0; i< numBears; i++)
  {
    tracker.display(bear[i]);
  }
  
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

  track.x = map(v1.x, 0, kinect.width, 0, width);
  track.y = map(v1.y, 0, kinect.height, 0, height);

  fill(255, 0, 0);
  ellipse(track.x, track.y, 20, 20);
  
  for(int i = 0; i< numBears; i++)
  {
    PVector loc = new PVector(bear[i]._location.x, bear[i]._location.y);
    
    pos.x = map(loc.x, 0, kinect.width, 0, width);
    pos.y = map(loc.y, 0, kinect.height, 0, height);

    imageMode(CENTER);
    //NOT SUPPOSED TO USE THIS -- BUT IT WORKS
    image(animalImg, pos.x, pos.y);
    bear[i].Draw();
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
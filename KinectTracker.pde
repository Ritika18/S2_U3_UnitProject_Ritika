class KinectTracker 
{
  // Depth threshold
  float threshold = 450;
  
  // Raw location
  PVector loc;
  
  // Interpolated location
  PVector lerpedLoc;
  
  // Depth data
  int[] depth;
  
  // What we'll show the user
  PImage display;
  
  boolean pick;
  boolean drop;
   
  KinectTracker() 
  {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    //kinect.enableMirror(true);
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, RGB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();


    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) 
    {
      for (int y = 0; y < kinect.height; y++) 
      {
        int offset =  x + y*kinect.width;
        
        // Grabbing the raw depth
        float rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }
    
    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display(Animal animal) 
  {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        
        int offset = x + y * kinect.width;
        float rawDepth = depth[offset];
        int pix = x + y * display.width;
        
        if (rawDepth < threshold) 
        {
          pick = true;
          display.pixels[pix] = color(50, 150, 150);
        } 
        else 
        {
          pick = false;
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
  }
  
  float getThreshold() {
    return threshold;
  }

  void setThreshold(float t) 
  {
    threshold =  t;
  }
}
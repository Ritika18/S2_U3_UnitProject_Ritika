class AnimalButton extends Animal
{
  AnimalButton()
  {
    
  }
  
  void collide(KinectTracker sketch)
  {
    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    if(sketch.pick == true)
    {
      if (dist (super._location.x, super._location.y, sketch.lerpedLoc.x , 
      sketch.lerpedLoc.y) < 50)
      {
        super._location = sketch.lerpedLoc;
      }
    }
  }
}
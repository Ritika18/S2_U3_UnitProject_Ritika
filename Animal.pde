class Animal
{
  /*
  Ways to pick up 
   1. holding out on time - millis()
   2. Threshold + position - based on how far it is
   
   How to release
   1. exit threshold
   
   Polish
   1. calibration: set the starting position depending on where they are (threshold)
   
   //need to tell it to hold and grab using the rawdepth
  */

  private PVector _location;
  private PVector _speed;
  private PImage _img;

  Animal(PVector location, PVector speed, PImage img)
  {
    _location = location;
    _speed = speed;
    _img = img;
    //_location = pos;
  }

  private void Draw()
  {
    ellipse(_location.x, _location.y, 100, 100);
    
    kinect.getDephToWorldPositions();
  }
  
  private void Move(KinectTracker move)
  {
    if(move.pick == true)
    {
      if (dist (_location.x, _location.y, move.lerpedLoc.x , move.lerpedLoc.y) < 50)
      {
        _location = move.lerpedLoc;
      }
    }
  }
}
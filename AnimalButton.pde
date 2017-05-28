class AnimalButton extends Entity
{
  boolean _isClicked;
  boolean _isHoveredOver;
  PVector _position = new PVector (super._location.x, super._location.y);
  PVector _tPos;
  PVector _position1;

  AnimalButton(PVector location, PImage img)
  {
    super(location, img);
    _isClicked=false;
    _isHoveredOver=false;
  }
  
  AnimalButton(PVector location, PImage img, PVector position, PVector tPos, boolean isClicked)
  {
    super(location, img);
    _position = position;
    _tPos = tPos;
    _isClicked = isClicked;
    
    println("Created an entity at: " + position.x + ", " + position.y);
  }
  
  void Collide(KinectTracker tracker)
  {
    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    
    _tPos = tracker.getLerpedPos();
    
    if (dist (super._location.x, super._location.y, track.x, track.y) < 50)
    {
      _isHoveredOver = true;
    }
    else
    {
      _isHoveredOver = false;
    }
    
  }

  public void Draw()
  {
    imageMode(CENTER);
    rectMode(CENTER);
    if(!_isHoveredOver)
    {
      fill(128,128,128);
      noTint();
    }
    else
    {
      fill(0,0,128);
      tint(0,0,128, 30);
    }

    stroke(0);
    rect(_position.x, _position.y, super._img.width+10, super._img.height+10);
    image(super._img, super._location.x, super._location.y);
    imageMode(CORNER);
  }
}
/*

 
 if (dist (animal._location.x, animal._location.y, lerpedLoc.x, 
 lerpedLoc.y) < 50)
 {
 pick = true;
 if(pick)
 {
 animal._location = lerpedLoc;
 }
 return;
 }
 else
 {
 pick = false;
 if(!pick)
 {
 animal._location = animal._location;
 }
 return;
 }
 */
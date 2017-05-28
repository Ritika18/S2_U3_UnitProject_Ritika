class AnimalButton extends Entity
{
  boolean _isClicked;
  boolean _isHoveredOver;

  AnimalButton(PVector location, PImage img)
  {
    super(location, img);
    _isClicked=false;
    _isHoveredOver=false;
  }

  void Collide(KinectTracker tracker)
  {
    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes

    //PVector tPos = tracker.getLerpedPos();
    PVector tPos = new PVector(mouseX, mouseY);

    if (dist (super._location.x, super._location.y, tPos.x, tPos.y) < 50)
    {
      _isHoveredOver = true;
    }
    else
    {
      _isHoveredOver = false;
    }
  }

  void Draw()
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
      tint(0,0,128, 50);
    }
    stroke(0);
    rect(super._location.x, super._location.y, super._img.width+10, super._img.height+10);
    image(super._img, super._location.x, super._location.y);
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
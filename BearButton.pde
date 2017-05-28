class BearButton extends AnimalButton
{    
  PVector _position1;

  BearButton(PVector location, PImage img,PVector position, PVector tPos, boolean isClicked)
  {
    super(location, img, position, tPos, isClicked);
  }
  
  private void notClicked(KinectTracker tracker)
  {
    if(tracker.rawDEPTH < tracker.threshold)
    {
      super._isClicked = false;
    }
  }
  
  public void Click(AnimalButton connect)
  {
    super._tPos = connect._tPos;
    super._position = connect._position;
    super._isClicked = connect._isClicked;
       
    //if(dist(posBear.x, posBear.y, super._tPos.x, super._tPos.y) <50)
    //{
    //  super._isClicked = true;
    //}
    
    keyPressed();
    
    if(super._isClicked == true)
    {
      connect._position = connect._tPos;
    }
    
    if(super._isClicked == false)
    {
      //super._position = posBear;
    }
  }
  
  private void keyPressed()
  {
    if(key == 'r')
    {
      _isClicked = true;
    }
  }

}
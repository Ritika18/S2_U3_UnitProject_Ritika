class WolfButton extends AnimalButton
{    
  PVector _position1;
  
  //AnimalButton connect;

  WolfButton(PVector location, PImage img,PVector position, boolean isClicked)
  {
    super(location, img, position, isClicked);
  }
  
  private void Update()
  {
    super.Draw();
    super.Collide();
    notClicked();
    Click();
  }
  
  private void notClicked()
  {
    if(tracker.getThreshold() < tracker.threshold)
    {
      super._isClicked = false;
    }
  }
  
  private void Click()
  {
    
    if(super._isClicked == true)
    {
      SetPos(tracker.getLerpedPos());
      //numBears++;
    }
    
    if(super._isClicked == false)
    {
      //SetPos(posWolf);
    }
  }
  
  private void keyPressed()
  {
    if(key == 'r')
    {
      super._isClicked = true;
    }
  }

}
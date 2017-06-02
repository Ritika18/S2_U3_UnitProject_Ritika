class Entity
{
  private PImage  _img;
  private PVector _location;
    
  Entity(PVector location, PImage img)
  {
    _location = location;
    _img = img;
    
    println("Created an entity at: " + location.x + ", " + location.y);
  }
    
  public void Draw()
  {
    imageMode(CENTER);
    image(_img, _location.x, _location.y);
  }
  
  public PVector GetPos()
  {
    return _location;
  }
    
  public void SetPos(PVector pos)
  {
    _location = pos;
  }
  
  
}
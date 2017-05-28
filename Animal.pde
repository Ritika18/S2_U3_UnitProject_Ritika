class Animal extends Entity
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
   
   TO DO:
   As soon as I place it "into the game" then it starts to move all by itself. It starts
   moving then as it comes near food (which will be determined by circle collision 
   depending on the size, it moves towards it and eats it or just eats it. I can figure
   that out later. To die they disappear. to walk they randomly continuously keep
   moving around.
   */

  private PVector _speed;

  Animal(PVector location, PVector speed, PImage img)
  {
    super(location,img);
    _speed = speed;
  }

  public void Draw()
  {
    ellipse(super._location.x, super._location.y, 100, 100);

    kinect.getDephToWorldPositions();
  }

  //private void Move(KinectTracker move)
  //{
  //  if (dist (pos.x, pos.y, move.lerpedLoc.x, move.lerpedLoc.y) < 50)
  //  {
  //    super._location = move.lerpedLoc;
  //  }
  //}

  private void Walk()
  {
    /*
    to make an animal walk, I have to change it's x :)
     
     I can create a function where it moves x amount right, then x amount left. Same
     amount both times so that it stays in it's position.
     
     How do I want walk to be turned on? If I put my curser over a WALK button
     */
  }

  private void Eat()
  {
    /*
    to make an animal eat, I have to make another part of the project disappear, as the 
     first animal "eats it"
     
     How do I want it to eat? When I move the object, if it hovers over an animal / plant
     that it can eat, then the other specie disappears and returns to the select pile
     */
  }

  private void Die()
  {
    /*
    to make an animal die, I need it to physcially disappear from the 
     
     How do I want it to die? 
     */
  }
}
class Spring {

  // We need to keep track of the spring’s anchor location.
  PVector anchor;

  // Rest length and spring constant variables
  float len;
  float k = 0.1;

  //The constructor initializes the anchor point and rest length.
  Spring(float x, float y, int l) {
    anchor = new PVector(x,y);
    len = l;
  }

  // Calculate spring force—our implementation of Hooke’s Law.
  void connect(Bob b) {

    //Get a vector pointing from anchor to Bob location.
    PVector force = PVector.sub(b.location,anchor);
    
    float d = force.mag();
    // Calculate the displacement between
    // distance and rest length.
    float stretch = d - len;

    //Direction and magnitude together!
    force.normalize();
    force.mult(-1 * k * stretch);

    // Call applyForce() right here!
    b.applyForce(force);
  }

  //Draw the anchor.
  void display() {
    fill(100);
    rectMode(CENTER);
    rect(anchor.x,anchor.y,10,10);
  }

  //Draw the spring connection between Bob location and anchor.
  void displayLine(Bob b) {
    stroke(0);
    line(b.location.x,b.location.y,anchor.x,anchor.y);
  }
  //[end]

}

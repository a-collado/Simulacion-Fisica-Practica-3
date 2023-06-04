class Spring {

  // We need to keep track of the springs anchor location.
  PVector anchor;

  // Rest length and spring constant variables
  float len;
  float k = 0.1;

  //The constructor initializes the anchor point and rest length.
  Spring(float x, float y, int l) {
    anchor = new PVector(x,y);
    len = l;
  }

  // Calculate spring force—our implementation of Hookes Law.
  void connect(Bob b) {

    //Get a vector pointing from anchor to Bob location.
    println(b.location);
    println(anchor);
    PVector force = PVector.sub(b.location,anchor);
    float d = force.mag();
    println(d);
    // Calculate the displacement between
    // distance and rest length.
    float stretch = d - len;
    println(stretch);

    //Direction and magnitude together!
    force.normalize();
    force.mult(-1 * k * stretch);
    println(force);

    // Call applyForce() right here!
    b.applyForce(force);
  }
  
    void connect2(Bob b, PVector force) {

    //Get a vector pointing from anchor to Bob location.
  
    // Calculate the displacement between
    // distance and rest length.
    //float stretch = d - len;
    float stretch = -force.y / k;

    //Direction and magnitude together!
    force.normalize();
    force.mult(-1 * k * stretch);
    println(force);

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

}

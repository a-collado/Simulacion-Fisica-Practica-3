class Mover {
 PVector location; 
 PVector velocity;
 PVector acceleration;
 float mass;

Mover(float m, float x , float y, PVector initialVel) {
  location = new PVector(x, y);
  velocity = initialVel;
  acceleration = new PVector(0,0);
  mass = m;
}

// Segunda ley de Newton: F = m * a
 void applyForce(PVector force) {
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
 }

 void update() {
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
  
  //Bote
  // Bounce off edges
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if (location.y > height-8) {
    velocity.y = velocity.y * -1; 
    location.y = height-8;
  }
 }
 
 void display() {
     stroke(0);
     fill(175);
     ellipse(location.x ,location.y ,mass*16,mass*16);    
  }
  
}

class Bob {
 PVector location; 
 PVector velocity;
 PVector acceleration;
 float mass;

Bob() {
  location = new PVector(width/2, height/2);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  mass = 1;
}

Bob(PVector l) {
  location = l;
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  mass = 1;
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
 }
 
 void display() {
     stroke(0);
     fill(175);
     ellipse(location.x ,location.y ,mass*16,mass*16);    
 }
  
}

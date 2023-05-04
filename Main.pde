Mover m;
Bob bob;
Spring spring;
int exercise;

void setup(){
  size(640,360);
  exercise = 2;
  m = new Mover(1, 100, 100, new PVector(3, 2.1));
  bob = new Bob();
  spring = new Spring(width/2, height/2, 1);
  frameRate(10);
}

void draw(){
  background(255);
  
  switch(exercise){
    case 1:
      exercise1();
    break;
    case 2:
      exercise2();
     break;
    default:
    break;
  }
}

void exercise1(){
  PVector gravity = new PVector(0, 9.81);
  m.applyForce(gravity);
  m.update();
  m.display();
  
}

void exercise2(){
  PVector gravity = new PVector(0, 9.81);
  bob.applyForce(gravity);
  
  spring.connect(bob);
  
  bob.update();
  bob.display();
  spring.display();
  spring.displayLine(bob);
  
}

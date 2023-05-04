Mover m;
int exercise;

void setup(){
  size(640,360);
  exercise = 1;
  m = new Mover(1, 100, 100, new PVector(3, 2.1));
  frameRate(15);
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
  
}

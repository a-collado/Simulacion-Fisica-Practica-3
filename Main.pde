Mover m;
Bob bob;
Spring spring;
int exercise;

// Exercici 2
float h = 360 - 100 - 16;  //height = 360
float mass = 1;
float k = 8;  // k de la molla
float d = 0.2;  // Porcentaje de deformació
float g = 9.81;
float dt = 0.1;
float t = 0;
PVector location = new PVector(100,100);
PVector velocity = new PVector(0,0);

  // Tenenemos que inventarnos: m, h, k, % de deformacion.
  float Ep;
  float v;
  
  float Ec;
  // (20% de la Ec) = 0.5*k*pow(x,2) -> x = A
  float Em;
  float A;
  float w;



float previousTime = 0;

void setup(){
  size(640,360);
  exercise = 3;
  m = new Mover(1, 100, 100, new PVector(0,0));
  bob = new Bob();
  spring = new Spring(width/2, height/2, 1);  
  
  Ep = 0f;
  v = 0f;
  Ec = 0f;
  Em = 0f;
  A = 0f;
  w = 0.0f;
  
  frameRate(20);
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
    case 3:
      exercise3();
    break;
    default:
    break;
  }
}

void exercise1(){
  PVector gravity = new PVector(0,0.1);
  m.applyForce(gravity);
  m.update();
  m.display();
  
}

void exercise3(){

  Ep = mass * g * h;
  
  v = sqrt(2*g*h);
  Ec = 0.5 * mass * pow (v,2);
  println(Ep + " " + Ec);


  println(h);

  w = sqrt(k/mass);

  float t = millis() / 1000.0;  // convert milliseconds to seconds
  float x = A * sin(w*t + 0);
  
  velocity.add(new PVector(0,g));
  location.add(velocity);
  
  if(velocity.y >= v){
    // (20% de la Ec) = 0.5*k*pow(x,2) -> x = A
    Em = d * Ec;
    Ec *= (1-d);
  
    A = sqrt(Em * 2 / k);
    h = abs(Ec) / (mass * g);
    velocity.y *= -0.8f;
    location.y = height-16;
  }

  ellipse(location.x, location.y, 30 * mass, 30 * mass - (A-x));
  println(h + " " + velocity);
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

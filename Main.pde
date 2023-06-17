Mover m;
Bob bob;
Spring spring;
int exercise;

// Exercici 2
float h = 360 - 100 - 16;  //height = 360
float mass = 1;
float k = 7;  // k de la molla
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

boolean firstBounce = false;

PVector lastPos;

PImage img;

void setup(){
  size(640,360);
  exercise = 2;
  m = new Mover(mass, 200, 100, new PVector(0,0));
  bob = new Bob(new PVector(m.location.x, m.location.y-16));
  spring = new Spring(m.location.x, m.location.y+16 , 32);
  spring.k = 1.5;
  lastPos = spring.anchor;
  img = loadImage("ball.png");
  
  Ep = 0f;
  v = 0f;
  Ec = 0f;
  Em = 0f;
  A = 0f;
  w = 0.0f;
  
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
  m.display(img);
  
}

void exercise2(){
  
  Ep = mass * g * h;
  
  v = sqrt(2*g*h);
  Ec = 0.5 * mass * pow (v,2);

  w = sqrt(k/mass);

  float t = millis() / 1000.0;   // Milisegundos a segundos
  float x = A * sin(w*t + 0);    // Deformacion de la pelota
  
  velocity.add(new PVector(0,g));
  location.add(velocity);
  
  if(velocity.y >= v){
    // (20% de la Ec) = 0.5*k*pow(x,2) -> x = A
    Em = d * Ec;                 // Energia de la deformacion 
    Ec *= (1-d);                 // Energia cinetica
  
    A = sqrt(Em * 2 / k);        // Amplitud de la pelota
    h = abs(Ec) / (mass * g);    // Altura del bote
    velocity.y *= -0.8f;         // Quitamos un 20% de la velocidad
    velocity.y += g;             // ESTO QUIZAS ESTA BIEN. HABRIA QUE PREGUNTAR.
    location.y = height-16;
  }

  fill(175);
  //ellipse(location.x, location.y, 30 * mass, 30 * mass - (A-x));
  imageMode(CENTER);
  image(img, location.x, location.y, 30 * mass, 30 * mass - (A-x));

}

void exercise3(){
  
  if (spring.anchor.y >= height) {
    firstBounce = true;
  }
  
  lastPos = spring.anchor.copy();
  spring.anchor.x = m.location.x;
  spring.anchor.y = m.location.y + 16f;
  bob.location.y -= lastPos.y - spring.anchor.y;
  
  //if (spring.anchor.y >= height) {spring.anchor.y -= 10;}
  //else {spring.anchor.y += 10;}
  PVector gravity = new PVector(0,g);
  if (firstBounce) {  bob.applyForce(gravity); }
  m.applyForce(gravity);
  spring.connect(bob);
  
  bob.update();
  bob.display();
  spring.display();
  spring.displayLine(bob);
  m.update2();
  m.display2(bob.location.y, spring.anchor.y, img);
}

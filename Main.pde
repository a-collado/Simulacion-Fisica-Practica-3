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
boolean firstBounce_aux = false;

void setup(){
  size(640,360);
  exercise = 3;
  m = new Mover(mass, 100, 100, new PVector(0,0));
  bob = new Bob(new PVector(m.location.x, m.location.y-16));
  spring = new Spring(m.location.x, m.location.y+16 , 32);
  spring.k = 2;
  
  Ep = 0f;
  v = 0f;
  Ec = 0f;
  Em = 0f;
  A = 0f;
  w = 0.0f;
  
  frameRate(1);
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
  //println(Ep + " " + Ec);

  //println(h);

  w = sqrt(k/mass);

  float t = millis() / 1000.0;  // convert milliseconds to seconds
  float x = A * sin(w*t + 0);    // Deformaicon de la pelota
  
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

  //ellipse(location.x, location.y, 30 * mass, 30 * mass - (A-x));
  //println(h + " " + velocity);
  
    //m.display();
  spring.anchor.x = m.location.x;
  spring.anchor.y = m.location.y + 16f;
  PVector gravity = new PVector(0,g);
  m.applyForce(gravity);
  m.update2();

  
  //bob.applyForce(gravity);
  
  //spring.connect(bob, new PVector());
  
  if (!firstBounce_aux) {
    
    //velocity.y = velocity.y * -0.8f; 
    //spring.connect(bob, new PVector(m.velocity.x, m.velocity.y * -0.2f));
    bob.location = new PVector(spring.anchor.x ,spring.anchor.y - 32);
    if(firstBounce){
      firstBounce_aux = true;
      spring.connect2(bob, m.velocity.mult(-0.2f);

    }
  } else if (spring.anchor.y > height-5) {
    spring.anchor.y = height-5;
    firstBounce = true;
  }
  bob.update();
  bob.display();
  spring.connect(bob);
  spring.display();
  spring.displayLine(bob);
  m.display2(bob.location.y, spring.anchor.y);
  //m.display();
}

void exercise2(){
  
  /*PVector gravity = new PVector(0, 9.81);
  bob.applyForce(gravity);
  
  spring.connect(bob);
  
  bob.update();
  bob.display();
  spring.display();
  spring.displayLine(bob);*/
}

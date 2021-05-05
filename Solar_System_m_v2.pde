import peasy.*;

PeasyCam cam;


void setup(){
  size(1800, 1000, P3D);
  cam = new PeasyCam(this, 8500); 
  frameRate(10);
}

void Sun(float r, float omega, PImage img){
  int fc=frameCount;
  PShape globe;
  pushMatrix();
  rotateY(fc*PI/omega);
 noStroke();
 noFill(); //fill(255, 255, 0);
 globe = createShape(SPHERE, r); //sphere(r);
 globe.setTexture(img);
 shape(globe);
  popMatrix();
}

void Planet(float r, float v, float omega, int prsX, int prsY, int prsZ, PImage img){
  int fc=frameCount;
  PShape globe;
pushMatrix();
  rotateY(fc*PI/v);
  translate(prsX, prsY, prsZ);
  fc=frameCount;
  rotateY(fc*PI/omega);
  noStroke();
 noFill();// fill(0, 255, 0);
 globe = createShape(SPHERE, r);// sphere(r);
 globe.setTexture(img);
 shape(globe);
  popMatrix();
  
}

void Earth(float r, float v, float omega, int prsX, int prsY, int prsZ, PImage img, float rk, PImage moon){
  int fc=frameCount;
  PShape globe, globe2;
 pushMatrix(); 
//translate(prsX,prsY, prsZ); //<--pierwszy  środek (niepotrzebny bo jest PeasyCam)
rotateY(fc*PI/v);     //<--ziemia wokół słońca
pushMatrix(); 
translate(prsX,prsY, prsZ);     //<---drugi środek
rotateY(fc*PI*omega/16);     // <---ziemia wokół własnej osi
noStroke();
 noFill();
 globe = createShape(SPHERE, r);
 globe.setTexture(img);
 shape(globe); 
rotateY(fc*PI/(2*omega));   //<----obrót księżyca wokół ziemi
pushMatrix();    //wprowadzamy księżyc
translate(0, 0, r+100);     //odsuń księżyc od ziemi
rotateY(fc*PI/omega);     //obrót księżyca wokół własnej osi
noStroke();
 noFill();
 globe2 = createShape(SPHERE, rk);
 globe2.setTexture(moon);
 shape(globe2);
// fill(255, 0, 0);
 //box(20, 20, 20);
  popMatrix();
  popMatrix();
  popMatrix();
}

void draw(){

  PImage[] textures = new PImage[10];
 PImage img;
img = loadImage("milky_way4.jpg");
background(img);
  //background(0,0,0);
  //noStroke();
  //noFill();
  lights();
  float Rs=1000;
  textures[0] = loadImage("sun4.jpg");
  textures[1] = loadImage("mercury4.jpg");
  textures[2] = loadImage("venus4.jpg");
  textures[3] = loadImage("earth4.jpg");
  textures[4] = loadImage("mars4.jpg");
  textures[5] = loadImage("jupiter4.jpg");
  textures[6] = loadImage("saturn4.jpg");
  textures[7] = loadImage("uranus4.jpg");
  textures[8] = loadImage("neptune4.jpg");
  textures[9] = loadImage("moon4.jpg");
  Sun(Rs, 500, textures[0]);
  Planet(0.05*Rs,     200,    216,     0,         0,     -1500,       textures[1]); //Merkury
  Planet(0.135*Rs,    100,    511,     -1900,      0,     0,           textures[2]); //Wenus
  Earth(0.135*Rs,     900,    1021,     0,         0,     2400,        textures[3], 0.04*Rs, textures[9]); //Ziemia
  Planet(0.075*Rs,    1800,   9,       2900,      0,     0,           textures[4]); //Mars
  Planet(0.5*Rs,      10000,  7,       4000,      0,     0,           textures[5]); //Jowisz
  Planet(0.42*Rs,     15000,  7,       0,         0,      -5000,      textures[6]); //Saturn
  Planet(0.185*Rs,    20000,  8,       0,         0,     5500,        textures[7]); //Uran
  Planet(0.18*Rs,     30000,  8,      -6200,     0,     0,           textures[8]); //Neptun
  
}

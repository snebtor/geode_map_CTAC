import java.io.BufferedWriter;
import java.io.FileWriter;
import oscP5.*;
import netP5.*;

// Pressing 'w' stores the coordinates of current shapes
// Pressing 'r' loads the shapes previously saved in polygons.txt
// pressing any other key applies texture on polygons


PGraphics pg;
float sec;
int mil;
int counter;
PShape halfdisk;

color akasa = color(255, 95, 126); //black
color vayu = color(97, 255, 225);//blue
color tejas = color(215, 223, 35);// red
color apas = color(15, 57, 99); //silver
color phritivi = color(237, 28, 36);//yellow
float val3, val4;
float angle;

boolean scene1 = true;
boolean scene2 = false;
boolean scene3 = false;
boolean scene4 = false;
boolean scene5 = false;
boolean scene6 = false;
boolean scene7 = false;
boolean whiteline = false;
boolean blackline = true;

OscP5 oscP5;
float valueenv1, valueenv2, valueenv3;
float door=200;


class Vertx {
 int x, y;
 Vertx(int xV, int yV) {
   x = xV;
   y = yV;
 }
} 

Vertx[]vertices;
Vertx vx1, vx2, vx3, vx4;
boolean firstpress, polygonClosed, editMode, applytex;
int x1, y1, x2, y2, a, verticesIndex;
float xoff, yoff,val1,val2;

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int r1, r2, r3;

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
 
float time_passed;
PVector A,B,C,D,E,F,G,H;



void settings() {
  //fullScreen(P3D,SPAN);
  fullScreen(P3D);
}


void setup() {
  frameRate(25);
  cursor(CROSS);
  pg = createGraphics(340, 340);
  A = new PVector((pg.width/2)-(door/2), (pg.height/2)-(door/2));
  B = new PVector((pg.width/2)+(door/2), (pg.height/2)-(door/2));
  C = new PVector((pg.width/2)+(door/2), (pg.height/2)+(door/2));
  D = new PVector((pg.width/2)-(door/2), (pg.height/2)+(door/2));
  E = new PVector(0, 0);
  F = new PVector(pg.width, 0);
  G = new PVector(pg.width, pg.height);
  H = new PVector(0, pg.height);

  oscP5 = new OscP5(this,8000);

  halfdisk = loadShape("09.svg");

  
  //lights();
  //size(3840, 800 ,P3D);
  //fullScreen(P2D, SPAN);
  
  pg = createGraphics(340, 340);
  textureMode(NORMAL);
  vertices = new Vertx[0];
    firstpress = editMode = true;
    polygonClosed = applytex = false;
    verticesIndex = 0;
    a = 0;
    smooth();
    background(0);
    w = 400+66; // connected to spacing of curved lines
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  time_passed = 0;
}

void draw() {
   
   val1=map(valueenv1,0,1,10,pg.width); 
   mil=millis();
   val2=map(valueenv2,0,1,0,255);
   sec=second()*0.02;
   angle+=0.0001;
   val4=sin(angle);
   val3=map(valueenv3,0,1,0.12,0.9); //tuned in for gradient
   
   //area for prototyping
 
if (counter >= 250) {
    r1 = (int)random(1,8);
    r2 = (int)random(1,8);  
    r3 = (int)random(1,8);
    counter = 0;
  }
  
  playanimation(r1);
  playanimation(r2);
  playanimation(r3);
  counter++;
  //
  if (scene1) circle();
  if (scene2) noisy();
  if (scene3) ripples();
  if (scene4) fluid();
   if (scene5) halfcirce();
   if (scene6) warp();
   if (scene7) triantunnel();
  
  
  //paint the pg image
  image(pg, 10, 10,100,100); 
  fill(255);
  text(valueenv1,10,30);
  text(counter,10,40);
  text(r1,10,50);
  text(r2,10,60);
  text(r3,10,70);
  text(val4*180,10,80);
  //text("EDITMODE: ON:", width-400,10);
  //text("TO SAVE PRESS W; TO RELOAD PRESS R", width-400,60);
  
  
  xoff += random(-0.6,0.6);
  
  //ADD GEOMETRY CREATION TOOL )No network
  if (applytex == true && vertices.length != 0) {
    background(0);
    
    for (int i=0; i<vertices.length; i=i+4) {      
      noStroke();
      
        //shape 1
      beginShape();
      texture(pg);
      vertex(vertices[i].x, vertices[i].y, 0, 0); 
      vertex(vertices[i+1].x, vertices[i+1].y, 1, 0); 
      vertex(vertices[i+2].x, vertices[i+2].y, 1, 1); 
      vertex(vertices[i+3].x, vertices[i+3].y, 0, 1); 
      endShape(CLOSE);    
    } 
  }  
}


void mousePressed() {
   
   applytex = false;
  if (firstpress == true){
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
    firstpress = false;
    
    vertices = (Vertx[]) expand(vertices, verticesIndex+1);
    vertices[verticesIndex] = new Vertx(x1, y1);   
  }else{
    x1 = x2;
    y1 = y2;
    x2 = mouseX;
    y2 = mouseY;

    //verticesIndex++;
    if (verticesIndex % 4 > 0 || polygonClosed == true) {
      vertices = (Vertx[]) expand(vertices, verticesIndex+1);
      vertices[verticesIndex] = new Vertx(x2, y2);
      polygonClosed = false;
    } else {
      polygonClosed = true;
      firstpress = true;
    }
  }
}

void mouseReleased(){
  if (verticesIndex % 4 == 0 && firstpress == true) {
    x2 = vertices[vertices.length-4].x;
    y2 = vertices[vertices.length-4].y;
    verticesIndex--;
    
  }
    verticesIndex++;
   // noStroke();
    stroke(225);
    //strokeWeight(1);
    line(x1, y1, x2, y2);
}

void keyPressed() {
  if (key == 'w') {   // write to file
    String points = "";
    for (int i = 0; i < vertices.length; i++) {
        String p1 = str(vertices[i].x);
        String p2 = str(vertices[i].y);
        points += p1 + "," + p2 + ";";       
    }
    String[] list = split(points, ';');
    // Writes the strings to a file, each on a separate line
     saveStrings("points.txt", list);    
  
  } else if (key == 'r') {
    String[] points = loadStrings("points.txt");

    vertices = (Vertx[]) expand(vertices, points.length-1);
    verticesIndex = points.length-1;
    
    for (int i = 0 ; i < points.length-1; i++) {      
      String[] list = split(points[i], ',');
      println("we are at index:  " + i);
      println(list[0]);
      println(list[1]);
      int px = Integer.parseInt(list[0]); 
      int py = Integer.parseInt(list[1]); 
      vertices[i] = new Vertx(px, py);   
    }
    
    applytex = true;
  
  } else {
    // apply texture to polygon(s)
    applytex = true;
  }
  
  if ( key == '1' )scene1 = !scene1;
  if ( key == '2' )scene2 = !scene2;
  if ( key == '3' )scene3 = !scene3;
  if ( key == '4' )scene4 = !scene4;

    if ( key == '5' )scene5 = !scene5;
     if ( key == '6' )scene6 = !scene6;
     if ( key == '7' )scene7 = !scene7;
  
  if ( key == 'a' )whiteline=!whiteline;
  if ( key == 's' )blackline=!blackline;
  
}

void playanimation(int r){
  
  switch (r) {
  case 1:
   circle();
    break;
  case 2:
   noisy();
    break;
  case 3: 
   ripples();

    break;
  case 4: 
    fluid();
    break;
    
     case 5: 
   halfcirce();
    
    break;
    
    case 6: 
     warp();
    break;
    
    case 7: 
     triantunnel();
    break;
    
  } 

}



// OSC events listener

void oscEvent(OscMessage theOscMessage) {

  //print(" typetag: "+theOscMessage.typetag());
  
  if(theOscMessage.checkAddrPattern("/env1")==true) { 
   valueenv1=theOscMessage.get(0).floatValue();
  println(valueenv1);
    
  }
  if(theOscMessage.checkAddrPattern("/env2")==true) { 
   valueenv2=theOscMessage.get(0).floatValue();
  println(valueenv2);
    
  }
  
  if(theOscMessage.checkAddrPattern("/env3")==true) { 
   valueenv3=theOscMessage.get(0).floatValue();
  println(valueenv3);
    
  }
  
  
}
void ripples(){
  pg.beginDraw();
  //pg.stroke(0,100);
  if (whiteline) pg.stroke(255,100);
  if (blackline)pg.stroke(0,100);
  pg.noFill();
  pg.strokeWeight(3);
 pg.pushMatrix();
  pg.translate(0,frameCount%120);
  for (int i=-168; i<=pg.width+160; i+=66){
  pg.pushMatrix();
  pg.beginShape();
  pg.scale(0.8);
  pg.translate(4,i);
   pg.vertex(0,44);
   pg.vertex(142,44);
    pg.vertex(142-val3*13,0);
    pg.vertex(370+val3*13,0);
    pg.vertex(370,44);
    pg.vertex(512,44);
  pg.endShape();
  pg.popMatrix();
  }
  pg.popMatrix();
  pg.endDraw();
}
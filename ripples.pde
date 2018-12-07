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
   pg.vertex(A.x,A.y);
   pg.vertex(B.x,B.y);
    pg.vertex(C.x-val3*13,C.y);
    pg.vertex(D.x+val3*13,D.y);
    pg.vertex(E.x,E.y);
    pg.vertex(F.x,F.y);
  pg.endShape();
  pg.popMatrix();
  }
  pg.popMatrix();
  pg.endDraw();
}

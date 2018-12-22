void warp(){
  pg.beginDraw();
   pg.beginShape(); 
   pg.blendMode(DIFFERENCE);
    pg.fill(255);
    pg.noStroke();
    pg.vertex(A.x+val2,0);
    pg.vertex(B.x+val2,0);
    pg.vertex(C.x-val1,pg.height);
    pg.vertex(D.x-val1,pg.height);
    pg.endShape(CLOSE);
    pg.blendMode(NORMAL);
   pg.endDraw();
}
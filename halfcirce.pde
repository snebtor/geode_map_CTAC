void halfcirce(){
pg.beginDraw();
   pg.shapeMode(CENTER);
   pg.noStroke();
  // pg.fill(tejas,220);
   //pg.rect(0,0,pg.width,pg.height);
   //pg.fill(phritivi);
   //pg.ellipse(pg.width/2,pg.height/2,map(value,0,1,10,pg.width),map(value,0,1,10,pg.width));
  
  pg.pushMatrix();
  pg.translate(pg.width/2,pg.height/2); // placement (center) of entity
  pg.scale(value*2); 
  pg.rotate(angle*120);
  pg.shape(halfdisk,0, 0);
  pg.popMatrix();
  pg.pushMatrix();
  //pg.shape(halfdisk,0, 0);
  pg.popMatrix();
  
  pg.endDraw();
}
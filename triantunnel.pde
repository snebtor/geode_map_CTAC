void triantunnel(){

  pg.beginDraw();
  pg.noStroke();
  pg.beginShape(); 
  pg.fill(41,199,176,val2);
  pg.vertex(0,0);
  pg.vertex(A.x+map(valueenv1,0,1,0,pg.width/3),A.y); //A
  pg.vertex(D.x,D.y-map(valueenv3,0,1,0,pg.width/3)); //D
  pg.vertex(0, pg.height);
  pg.endShape(CLOSE);
  
  
  pg.beginShape(); 
 
  pg.fill(249,243,160,val2);
  pg.vertex(0,0);
  pg.vertex(A.x+map(valueenv1,0,1,0,pg.width/3),A.y);  //A
  pg.vertex(B.x,B.y+map(valueenv3,0,1,0,pg.width/3)); //B
  pg.vertex(pg.width, 0);
  pg.endShape(CLOSE);
  
  
  pg.beginShape(); 
  pg.fill(255,233,3,val2);
  pg.vertex(pg.width, 0);
   pg.vertex(B.x,B.y+map(valueenv3,0,1,0,pg.width/3)); //B
   pg.vertex(D.x,D.y-map(valueenv3,0,1,0,pg.width/3)); //D
   pg.vertex(pg.width, pg.height);
  pg.endShape(CLOSE);
  
  
  pg.beginShape(); 
  pg.fill(255,94,160,val2);
   pg.vertex(D.x,D.y-map(valueenv3,0,1,0,pg.width/3)); //D
   pg.vertex(pg.width, pg.height);
   pg.vertex(0, pg.height);
  pg.endShape(CLOSE);
  
  pg.beginShape(); 
  pg.fill(174,145,224,val2);
  pg.vertex(A.x+map(valueenv1,0,1,0,pg.width/3),A.y);  //A
  pg.vertex(B.x,B.y+map(valueenv3,0,1,0,pg.width/3)); //B
  pg.vertex(D.x,D.y-map(valueenv3,0,1,0,pg.width/3)); //D
  pg.endShape(CLOSE);
  
  

pg.endDraw();
  





}
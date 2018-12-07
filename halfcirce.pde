void halfcirce(){
pg.beginDraw();
pg.pushMatrix();
  //pg.translate((width/2)-500,height/2); // placement (center) of entity
  pg.scale(0.2); 
  pg.rotate(angle);
  //noStroke();
  //pg.fill(#FF7546);
  //pg.rect(0,0,(120*val2)+1,(120*val2)+1);
   pg.pushMatrix();
  //rotate(angle2*0.1);
  //translate(width/2,height/2);
  //pg.shape(b, 0, 0,b.width*val+133,b.height*val+133);
  pg.popMatrix();
  //pg.rotate(sec);
  pg.shape(halfdisk, mouseX, mouseY);
  //shape(a, 10, 28, (a.width*val),(a.height*val));
  //shape(a, 20, 48, (a.width*val),(a.height*val));
  //shape(a, 30, 68, (a.width*val),(a.height*val));
  //shape(a, 40, 88, (a.width*val),(a.height*val));
  pg.popMatrix();
  pg.endDraw();
}

void circle(){
  pg.beginDraw();
   
  
  //1280 x 800
//stroke(255);

for (int i = 0; i <= pg.height; i++) {
      float n = map(i,0,pg.height,0,val3);
      color c = lerpColor(tejas, vayu, n);
      pg.stroke(c);
       pg.line(val1, i, pg.width,i);
    }
for (int i = 0; i <= pg.width; i++) {
      float n = map(i,0,pg.width,0,val3);
      color c = lerpColor(phritivi, akasa, n );  
      pg.stroke(c);
      pg.line(i, val2, i,120);
    }
    
for (int i = 0; i <= pg.width; i++) {
      float n = map(i,0,pg.width,0,sec);
      color c = lerpColor(akasa, vayu, n);
       pg.stroke(c);
       pg.line(i, 220, i,val2);
    }
    pg.noStroke();
     //pg.fill(c);
     
    //  pg.ellipse(pg.width/2,pg.height/2,20,20);
  pg.endDraw();
}

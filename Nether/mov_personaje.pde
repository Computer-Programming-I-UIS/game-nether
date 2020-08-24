void mov(){
 for(int i=0; i<barras-1; i++){
   if(perx<posarriba[i]+89 && perx>posarriba[i]+38){
     poy=height;
   }
 }
 
 fill(0,0,255);
 if(perx<=500 || vuel>=3){
 if(keyPressed == true &&  key==CODED){
   if(keyCode == RIGHT && pery+60<=poy2){
    perx+=2;
    bar+=0.1;
 
   }
   if( keyCode == LEFT && pery+60<=poy2 && perx>=0){
    perx-=2;
    bar-=0.1;
    
   }
 }
 }
textSize(20);
  text(level,10,60);
  text(dist,10,80);
/*  textSize(20);
  text(gar,10,20);
  text(pery,10,40);
  text(poy2,10,60);
  text(vid, 1000,20); */



 if(keyPressed == true &&  key==CODED && keyCode == UP && pery+60==poy){
   sub=1;
   gar=4;
   fill(255);
   rect(50,50,30, 30);

   }
     copy(sprite1,0,ny,64,64,perx,pery,45,60);
     
     
    if(pery+60==poy){
        ny=64;
    }
   
    if(sub==1  &&  pery+60<=poy){
    pery-=gar+0.1;
    gar-=0.1;
    ny=384; 
     
    }
    else if(pery+60<poy){
    pery-=gar+0.1;
    gar-=0.1;
      
    }
    if(pery+60>poy) {
     pery=poy-60;              //uso altura 
     sub=0;
     gar=0;
    } 
   
  
}

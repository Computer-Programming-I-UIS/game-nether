void mov(){
 for(int i=0; i<barras-2; i++){
   if(perx<posarriba[i+1]-16 && perx>posarriba[i]+36){
     poy=height;
   }
 }
 
 fill(0,0,255);
 if(keyPressed == true &&  key==CODED && keyCode == RIGHT){
    perx+=2;
    
   }
   if(keyPressed == true &&  key==CODED && keyCode == LEFT){
    perx-=2;
    
   }
  textSize(20);
  text(gar,10,20);
  text(pery,10,40);
  text(poy,10,60);
  text(vid, 1000,20);



 if(keyPressed == true &&  key==CODED && keyCode == UP && pery+60==poy){
   sub=1;
   gar=4;
   fill(255);
   rect(50,50,30, 30);
   }
    
     rect(perx, pery, 40, 60); 
   
    if(sub==1  &&  pery+60<=poy){
    pery-=gar+0.1;
    gar-=0.1;
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

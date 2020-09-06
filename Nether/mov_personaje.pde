void mov(){
 for(int i=0; i<barras-1; i++){
   if(perx<posarriba[i]+89 && perx>posarriba[i]+38){          //CAMBIAR LA MINUMA POSICION EN Y CUANDO SALE DE LA PLATAFORMA
     poy=height;
    }
  }
 
 fill(0,0,255);
 if(perx<=500 || vuel>=28 ){
   if(rightcode && pery+60<=poy2){                   //MOVER A LA DERECHA EL PERSONAJE
      perx+=2;
      bar+=0.1;
    }
  }
 
 if(upcode && pery+60==poy){
     sub=1;                                                                      //SALTAR
     gar=4;
     fill(255);
   } 
  copy(sprite1,0,ny,64,64,perx,pery,45,60);                             //DIBUJAR PERSONAJE
 
  if(pery+60==poy){
      ny=64;
    }
   
    if(sub==1  &&  pery+60<=poy){
      pery-=gar+0.1;                                                   //HACER EL SALTO DEL PERSONAJE 
      gar-=0.1;
      ny=384; 
    }
   else if(pery+60<poy){
      pery-=gar+0.1;
      gar-=0.1;
      ny=384;   
    }
    if(pery+60>poy) {
       pery=poy-60;             
       sub=0;
       gar=0;
        ny=384; 
     } 
    
  if(pery>=380 && pery<=400 ){
      pery+=1;  
      gar=-0.5;
   }
}
/*
cqmbios 
1 do while
2 funcion de i-1
*/

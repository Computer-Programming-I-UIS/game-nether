 void barras(){
    //////___________barras__________________////////
  
    for(int i=0; i<barras-1; i++){
     fill(255);
    if(i==8)
    fill(255,0,0);
    rect(posarriba[i], posy[i], 50, 40);
    copy(sprite3,7,41,22,15,posarriba[i],posy[i],70,55);                         //MOSTRAR LAS COLUMNAS
    if(perx>posarriba[i]-30 && perx<posarriba[i]+37){
     poy=posy[i]; 
     
    }
  
 }
 
 
  //////___________mov barras__________________//////// 
  for(int i=0; i<barras-1; i++){
     if(perx>posarriba[i]-35 && perx<posarriba[i]+85){
       poy2=posy[i];
        
      }
          
   
        if(perx>500 && rightcode && pery+60<=poy2 && vuel<3){
        posarriba[i]-=2;
        if(posarriba[i]<-50 && i>0){                                          //HACER QUE LAS COLUMNAS SE MUEVAN 
          posarriba[i]= posarriba[i-1]+esp;
          bar+=1.5;
       }
        if(posarriba[0]<-50 && i==0){
          posarriba[0]= posarriba[barras-2]+esp;
          bar+=1.5;
          vuel+=1;
       }
   }
  
    }
   
  }

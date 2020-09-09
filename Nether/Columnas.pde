class columnas{
float no;
  columnas(float clas){
   clas=no; 
  }
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

//////___________mov barras__________________//////// 
  
    if(perx>posarriba[i]-35 && perx<posarriba[i]+85){ 
       poy2=posy[i]; 
      }
     
    if(perx>500 && rightcode && pery+60<=poy2 && vuel<28){
      posarriba[i]-=2;
     if(i<=4){ 
      bolasx[i]-=2;
     }
        resta(i);
        if(posarriba[i]<-50){                                          //HACER QUE LAS COLUMNAS SE MUEVAN 
           posarriba[i]= posarriba[rest]+esp;
            bar+=1.5;
            vuel+=1;
        }
      }
    }
  }
  
 void level2(){
    
      for(int i=0; i<barras-1; i++){
        if(perx>posarriba[i]-35 && perx<posarriba[i]+80){                     //HACER QUE LA BARRAS SUBAN
          if(i+1>barras-2){
            rest=0;
          }
          if(i+1<=barras-2){
           rest=i+1; 
          }
          
          if(posy[rest]>100 && posi!=-1 ){
               posi=1;
            }
         else if(posy[rest]>400 && posi!=1 ){
                  posi=1;
           }
                
         else{
               posi=-1;
              }
              posy[rest]-=1*posi*level;
          
      }
    }
 
    bolas();
}
}

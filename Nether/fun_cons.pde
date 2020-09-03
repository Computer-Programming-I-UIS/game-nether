void cora(){
   for(int i=0; i<vid; i++){
   noStroke(); 
   fill(255, 0, 0);
   ellipse(1065+cor,20,10,10);                                  //DIBUJAR LOS CORAZONES DE VIDA 
   ellipse(1055+cor,20,10,10);
  triangle(1049+cor,20, 1070+cor ,20 , 1060+cor ,32); 
 cor-=30;
 }  
 if(vuel>=3 && dist>=40 && sum!=0){
      noStroke();
     fill(255, 0, 0);
     ellipse(posarriba[8]+25,posy[8]-30,10,10);
     ellipse(posarriba[8]+15,posy[8]-30,10,10);                                         //DIBUJAR EL CORAZON FINAL 
     triangle(posarriba[8]+9,posy[8]-30, posarriba[8]+30 ,posy[8]-30 , posarriba[8]+20, posy[8]-15); 
 }
 dist=dist(perx,pery,posarriba[8]+25, posy[8]-30);                                   //DISTANCIA ENTRE EL JUGADOR Y EL CORAZON
 
 if(vuel>=3 && dist<=40 && sum!=0){
   vid+=1;                                                                            //OBTENER EL CORAZON
   sum=0;
 }
}
void perder(){
   if(pery>=height-60){                     // CUADNO EL PERSONAJE LLEGE A LA LAVA, PIERDA 
     vid--;
     vuel=0;
     pery=posy[0]-60;                    
     perx=posarriba[0]+5;
     bar=2;
     x=0;
     for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;  
        
    }
    if(vid<=0){
     for(int i=0; i<=barras-1; i++){          
      if(i==0){
      posy[i]=int(random(150,400));
      posy[i+8]=posy[i]+int(random(-40,40));
     }
    else{ 
      if(posy[i-1]<=370 && posy[i-1]>=100){
    posy[i]=int(random(posy[i-1]-50,posy[i-1]+50));                     
    
  } //if rango
      
      if(posy[i-1]>=370 && posy[i-1]<=420 ){
         posy[i]=int(random(posy[i-1]-50, 420));                          //condiciones para la altura
      }
     if(posy[i-1]<=100 ){
         posy[i]=int(random(100, 150));
      }
    }  //else
    }
    }
    pery=posy[0]-60;                     //uso alt
     perx=posarriba[0]+5;
     
     
   }
  
}
void level2(){
  for(int i=0; i<barras-1; i++){
    if(perx>posarriba[i]-35 && perx<posarriba[i]+80){                     //HACER QUE LA BARRAS SUBAN
     if(i<barras-2 ){
         if(posy[i+1]>100 && posi!=-1 ){
             posi=1;
             }
         else if(posy[i+1]>400 && posi!=1 ){
              posi=1;
             }
        else{
              posi=-1;
             }
              
               posy[i+1]-=1*posi*level;
              
      } 
      if(i==barras-2 ){                                                      //HACER QUE LA ULTIMA BARRA SUBA Y BAJE 
         if(posy[0]>100 && posi!=-1 ){
             posi=1;
             }
         else if(posy[0]>400 && posi!=1 ){
              posi=1;
             }
        else{
              posi=-1;
             }
              
               posy[0]-=1*posi*level;
              
      } 
      
    }
      
      
    } 
    
  }
  
  

void cora(){
   for(int i=0; i<vid; i++){
   noStroke(); 
   fill(255, 0, 0);
   ellipse(1065+cor,20,10,10);
   ellipse(1055+cor,20,10,10);
  triangle(1049+cor,20, 1070+cor ,20 , 1060+cor ,32); 
 cor-=30;
 }  
 if(sum!=0 && dist>=40 ){
      noStroke();
     fill(255, 0, 0);
     ellipse(posarriba[sum+1]+25,posy[sum+1]-30,10,10);
     ellipse(posarriba[sum+1]+15,posy[sum+1]-30,10,10);
     triangle(posarriba[sum+1]+9,posy[sum+1]-30, posarriba[sum+1]+30 ,posy[sum+1]-30 , posarriba[sum+1]+20, posy[sum+1]-15); 
 }
 dist=dist(perx,pery,posarriba[sum+1]+25, posy[sum+1]-30);
 
 if(dist<=40 && sum!=0){
   vid+=1;
   sum=0;
 }
}
void perder(){
   if(pery>=height-60){                     // uso altura 
     vid--;
     vuel=0;
     pery=posy[0]-60;                     //uso altura
     perx=posarriba[0]+5;
     bar=2;
     x=0;
     for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;                          
    }
    pery=posy[0]-60;                     //uso altura
     perx=posarriba[0]+5;
   }
  
}
void level2(){
  for(int i=0; i<barras-1; i++){
    if(perx>posarriba[i]-35 && perx<posarriba[i]+80){
     if(i<barras-2 ){
         if(posy[i+1]>100 && posi!=-1 ){//movimiento de boca
             posi=1;
             }
         else if(posy[i+1]>400 && posi!=1 ){
              posi=1;
             }
        else{
              posi=-1;
             }
              
               posy[i+1]-=1*posi;
              
      } 
      if(i==barras-2 ){
         if(posy[0]>100 && posi!=-1 ){//movimiento de boca
             posi=1;
             }
         else if(posy[0]>400 && posi!=1 ){
              posi=1;
             }
        else{
              posi=-1;
             }
              
               posy[0]-=1*posi;
              
      } 
      
    }
      
      
    } 
    
  }
  
  

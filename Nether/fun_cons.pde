void cora(){
   for(int i=0; i<vid; i++){
   noStroke(); 
   fill(255, 0, 0);
   ellipse(1065+cor,20,10,10);
   ellipse(1055+cor,20,10,10);
  triangle(1049+cor,20, 1070+cor ,20 , 1060+cor ,32); 
 cor-=30;
 }  
}
void perder(){
   if(pery>=height-60){                     // uso altura 
     vid--;
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
  
  
  
}

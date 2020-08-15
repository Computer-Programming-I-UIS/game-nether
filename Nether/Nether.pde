barras barra;
int sum=0, barras=20;
float x=0, esp=70,y;
float perx=5, pery, press=0,  sub;

float posarriba []= new float[barras];                                      // array para la posicion x superior
float posabajo []= new float[barras];                                       // array para la posicion x inferior
float posy []= new float[barras];                                           // array posicion en y


void setup(){
 // rectMode(CORNERS);
  size(1080,500); 
   for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;                           //rect(posxarriba, posyarriba, posicionxabajo, posecioydeabajo)
    }
     x=2*esp/3;
     for(int i=0; i<=barras-1; i++){                                         //definir la posicion x del vertice inferior
      posabajo[i]=x;
      x+=esp;
    }
     for(int i=0; i<=barras-1; i++){                                        // posicion en y de las barras
      
     if(i==0){
      posy[i]=random(150,450);
     }
    else{ 
      if(posy[i-1]<=419 && posy[i-1]>=100){
    posy[i]=random(posy[i-1]-50,posy[i-1]+50);
    
  } //if rango
      if(posy[i-1]>=419 && posy[i-1]<=470 ){
         posy[i]=random(posy[i-1]-50, 465);
      }
     if(posy[i-1]<=100 ){
         posy[i]=random(100, 150);
      }
    }  //else
     } //for
 pery= posy[0]-20;

}  // cerra setup

void draw(){
   background(0);
  if(keyPressed == true &&  key==CODED && keyCode == UP && sum<=60 ){
   sub=1;
   fill(255);
   rect(50,50,30, 30);
  }
  
  if(sub==1 && sum<=200){
   sum+=2;
   pery-=2;
   }
   else{
    sub=0;
    
   }
   if(sum>=200 && sub==0){
     press=1;
   }
   
  if(press!=0 && sum>0){
    sum-=2;
    pery+=2;
   for(int i=0; i<barras-1; i++){
    if(pery>=posy[i]){
      sum=0;
    }  
   }
   }
  else{
    press=0;
  }

   
 /*  else{
     press=0;
   }
   
  if(press==1){
    sub=1;
  }*/
   
 
   
     
  for(int i=0; i<barras-1; i++){
     fill(255);
    rect(posarriba[i], posy[i], 2*esp/3, 470-posy[i]);
    if(pery+20<posy[i] && sum==0 && perx>posarriba[i] && perx<posarriba[i]+40){
    pery+=2; 
    }
 
  }
  /*
  for(int i=0; i<barras-1; i++){
   if(perx>posarriba[i] && perx<posarriba[i]+40){
    if(pery<posy[i]-90 || pery>posy[i]-20 ){
    sum=0;
  }
  
    if( press==1  && pery>posy[i]-90  ){
    sum=1; 
    
   }
   else{
    press= 0;
   }
   
   if(press==0 && pery<posy[i]-21){
    sum=-1;  
   }
  
  }
  }*/

/*  if(sum==1){
    pery-=2; 
  }
  if(sum==-1){
    pery+=2; 
  }
 // for  */
 
 fill(0,0,255);
 if(keyPressed == true &&  key==CODED && keyCode == RIGHT){
    perx+=2;
    
   }
   if(keyPressed == true &&  key==CODED && keyCode == LEFT){
    perx-=2;
    
   }
  textSize(20);
  text(sum,10,20);
  rect(perx, pery, 20, 20); 
  
} //cerrar void

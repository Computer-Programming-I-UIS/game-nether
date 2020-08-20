barras barra;
int sum=0, barras=10;
float x=0, esp=120, y, gar=0;
float perx=5, pery, press=0,  sub, poy;

float posarriba []= new float[barras];                                      // array para la posicion x superior
float posabajo []= new float[barras];                                       // array para la posicion x inferior
float posy []= new float[barras];                                           // array posicion en y


void setup(){
 // rectMode(CORNERS);
  size(1080,500); 
   for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;                          
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
  
 for(int i=0; i<barras-1; i++){
     fill(255);
    rect(posarriba[i], posy[i], 50, 470-posy[i]);
    if(perx>posarriba[i] && perx<posarriba[i]+40){
     poy=posy[i]; 
    }
   
 }
 for(int i=0; i<barras-2; i++){
   if(perx<posarriba[i+1] && perx>posarriba[i]+40){
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



 if(keyPressed == true &&  key==CODED && keyCode == UP &&  pery+20==poy){
   sub=1;
   gar=4;
   fill(255);
   rect(50,50,30, 30);
   }
    
     rect(perx, pery, 20, 20); 
    if(sub==1  &&  pery+20<=poy ){
    pery-=gar+0.1;
    gar-=0.05;
    }
     
    /* else if (perx>posarriba[i] && perx<posarriba[i]+40){
     sub=0; 
     gar=0;
    } */
    if(pery+20>poy) {
     pery=poy-20;
    } 
   
 
  
} //cerrar void

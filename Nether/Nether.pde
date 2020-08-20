
int sum=0, barras=10, vid=1;
float x=0, esp=120, gar=0;
float perx=5, pery, sub, poy;

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
  if(vid>0){
 for(int i=0; i<barras-1; i++){
     fill(255);
    rect(posarriba[i], posy[i], 50, 470-posy[i]);
    if(perx>posarriba[i] && perx<posarriba[i]+40){
     poy=posy[i]; 
    }
   
 }
 mov();
 if(pery>=height-20){
   vid--;
 }
  }
  else{
   textSize(50);
   text("GAME OVER", 300, 200);
  }
  
} //cerrar void

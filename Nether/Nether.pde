
int sum=0, barras=10, vid=5, ini;
float x=0, esp=120, gar=0, bar=2;
float perx=5, pery, sub, poy, pox, poy2, cor;

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
 pery= posy[0]-60;

}  // cerra setup

void draw(){
   background(0);
  if(vid>0){
   if(keyPressed==true){
     ini=1;
   }
    if(ini==1){

      barras();
      fill(0, 255, 0);
      rect(20, 20, bar, 20);
      
//////___________mover personaje__________________////////
 mov();                     
 
 //////___________perder__________________////////
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
 //////////_________CORAZONES_____________///////
 for(int i=0; i<vid; i++){
   noStroke(); 
   fill(255, 0, 0);
   ellipse(1065+cor,20,10,10);
   ellipse(1055+cor,20,10,10);
  triangle(1049+cor,20, 1070+cor ,20 , 1060+cor ,32); 
 cor-=30;
 }
 cor=0;
 stroke(2);
 
 }
 
 else{
   textSize(50);
   text("PRESIONE CUALQUIER COSA", 300, 200);
 }
}
  else{
   //////___________GAME OVER__________________////////
    textSize(50);
   text("GAME OVER", 300, 200);
   ini=0;
  }
  
} //cerrar void

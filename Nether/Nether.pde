
int sum=0, barras=10, vid=5, ini;
float x=0, esp=120, gar=0;
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
    //////___________barras__________________////////
  
    for(int i=0; i<barras-1; i++){
     fill(255);
    if(i==8)
    fill(255,0,0);
    rect(posarriba[i], posy[i], 50, 470-posy[i]);
    if(perx>posarriba[i]-30 && perx<posarriba[i]+37){
     poy=posy[i]; 
     poy2=posy[i];
    }
  
 }
  
  for(int i=0; i<barras-1; i++){
     if(perx>posarriba[i]-35 && perx<posarriba[i]+85){
       poy2=posy[i];
         
      }
   
        if(perx>500 && keyPressed == true &&  key==CODED && keyCode == RIGHT && pery+60<=poy2){
        posarriba[i]-=2;
        if(posarriba[i]<-50 && i>0){
          posarriba[i]= posarriba[i-1]+esp;
       }
        if(posarriba[0]<-50 && i==0){
        
          posarriba[0]= posarriba[barras-2]+esp;
       }
   }
 
    }
    
//////___________mover personaje__________________////////
 mov();                     
 
 //////___________perder__________________////////
   if(pery>=height-60){                     // uso altura 
     vid--;
     pery=posy[0]-60;                     //uso altura
     perx=posarriba[0]+5;
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

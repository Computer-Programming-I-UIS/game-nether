
int sum=0, barras=10, vid=5, ini, level=2;
float x=0, esp=120, gar=0, bar=40, posi, bon=1, dist;     
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
   if(keyPressed== true && (key=='r' ||key=='R')){
     ini=1;
   }
    if(ini==1){

      barras();
      fill(0, 255, 0);
      rect(20, 20, bar, 20);
      mov(); 
//////___________pasar nivel__________________//////// 
      if(bar>=55 && ini==1){
       ini=0;
       level+=1;
      }
 
 //////___________perder__________________////////
  perder();
 //////////_________CORAZONES_____________///////
  cora();
  cor=0;
  stroke(2);
  rect(70,20,20,20);
  if(level==2){
   level2(); 
  }
 
 }
 
 else{
    textSize(50);
    if(level==1)
    text("PRESIONE CUALQUIER COSA", 300, 200);
    if(level>=2){
    text("FELICIDADES BIENVENIDO AL NIVEL: ", 50, 200);
    text(level, 920, 200);
   }
 }
}
  else{
   //////___________GAME OVER__________________////////
    textSize(50);
   text("GAME OVER", 300, 200);
   ini=0;
  }
  
} //cerrar void

PImage sprite1,sprite2,sprite3, edad;
int x=0, esp=120, sum=1, barras=10, vid=5, ini, level=1;
int vuel=0,poy, pox, poy2,perx=5, pery,ny=0, yc=0, tutorial;
float  gar=0, bar=40, posi, bon=1, dist;     
float sub, cor;

PFont letra;
int posarriba []= new int[barras];                                      // array para la posicion x superior
int posabajo []= new int[barras];                                       // array para la posicion x inferior
int posy []= new int[barras];                                           // array posicion en y


void setup(){
 // rectMode(CORNERS);
  letra =loadFont("Monospaced.bold-48.vlw");
  textFont(letra);
  sprite1=loadImage("jugador1 (1).png");
  sprite2=loadImage("lava.png");
  sprite3=loadImage("columna.png");
  edad=loadImage("ESRB-E10.png");
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
      posy[i]=int(random(150,400));
      posy[i+8]=posy[i]+int(random(-40,40));
     }
    else{ 
      if(posy[i-1]<=370 && posy[i-1]>=100){
    posy[i]=int(random(posy[i-1]-50,posy[i-1]+50));
    
  } //if rango
      
      if(posy[i-1]>=370 && posy[i-1]<=420 ){
         posy[i]=int(random(posy[i-1]-50, 420));
      }
     if(posy[i-1]<=100 ){
         posy[i]=int(random(100, 150));
      }
    }  //else
     } //for
 pery= posy[0]-60;

}  // cerra setup

void draw(){
   background(0);
  
   textSize(20);
   text(2*posi*level, 20, 20);
  
   
  if(vid>0){
   if(keyPressed== true && key==' ' && tutorial!=1){
     ini=1;
   }
    if(keyPressed==true && key=='r'){
      ini=0;
      tutorial=0;
    }
    if(keyPressed==true && key=='t'){
      tutorial=1;
      
    }
   if(tutorial==1 && ini!=1 ){ 
     fill(150);
     stroke(0,0, 0);
     rect(100,100,40,40,10);
     rect(100,150,100,40,10);
     rect(100,200,40,40,10);
      rect(100,250,40,40,10);
     strokeWeight(3);
     stroke(255,255, 255);
     triangle(105,235,118,205,135,235);
     triangle(105,285,105,255, 135,270);
      textSize(40);
      fill(0);
      text("R",108,135);
      fill(255);
      text("REGRESAR", 145,135);
      text("INICIO", 198,185);
      text("SALTAR", 145,230);
      text("IR A LA DERECHA", 145,285);
       fill(0);
       textSize(30);
       text("SPACE",105,185);
        copy(sprite1,0,0,64,64,100,400,45,60);
   } 

    if(ini==1){

      barras();
  
      mov(); 
//////___________pasar nivel__________________//////// 
      
      if(vuel>=3 && perx>posarriba[0] && pery+60==poy){
       ini=0;
       level+=1;
       bon=1;
       sum=1;
       bar=40;
       x=0;
       vuel=0;
     for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;                          
    }
    pery=posy[0]-60;                     //uso altura
     perx=posarriba[0]+5;
   }  
      
 
 //////___________perder__________________////////
  perder();
 //////////_________CORAZONES_____________///////
  cora();
  cor=0;
  stroke(2);
  if(level>=2){
   level2(); 
  }
    
      copy(sprite2,0,13,32,32,0,450,600,120);
      copy(sprite2,0,13,32,32,500,450,600,120);
 }
 
 else{
    if(tutorial!=1){
    copy(edad,0,0,450,600,50,400,45,60);
    textSize(40);
    fill(255);
    if(level==1)
    text("PRESIONE SPACE PARA INICIAR", 200, 300);
    if(level>=2){
    textSize(50);
    text("FELICIDADES BIENVENIDO AL NIVEL: ", 50, 200);
    text("PRESIONE SPACE", 300, 300);
    text(level, 1010, 200);
   }
 }
 }
}
  else{
   //////___________GAME OVER__________________////////
  fill(255);
    textSize(50);
   text("GAME OVER", 300, 200);
   ini=0;
  }
  
} //cerrar void

PImage sprite1,sprite2,sprite3;
int x=0, esp=120, sum=0, barras=10, vid=5, ini, level=1, vuel=0,poy, pox, poy2,perx=5, pery,ny=0, yc=0;
float  gar=0, bar=40, posi, bon=1, dist;     
float sub, cor;

int posarriba []= new int[barras];                                      // array para la posicion x superior
int posabajo []= new int[barras];                                       // array para la posicion x inferior
int posy []= new int[barras];                                           // array posicion en y


void setup(){
 // rectMode(CORNERS);
  sprite1=loadImage("jugador1 (1).png");
  sprite2=loadImage("lava.png");
  sprite3=loadImage("columna.png");
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
   
  
   
  if(vid>0){
   if(keyPressed== true && (key=='r' ||key=='R')){
     ini=1;
   }
    if(ini==1){
      copy(sprite2,0,13,32,32,0,440,1080,120);
      barras();
      fill(0, 255, 0);
      rect(20, 20, bar, 20);
      mov(); 
//////___________pasar nivel__________________//////// 
      if(vuel>=3 && perx>posarriba[0]){
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
  rect(70,20,20,20);
  if(level>=2){
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

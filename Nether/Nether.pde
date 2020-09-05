/*
Autores: 
Alfonso Daniel Sanchez Lemus-2191708
Nestor Ivan Matajira Ortiz-2190414

Descripcion: este es un pequeño juego tipo parkour el cual no consta de poder retroceder por lo que dificulta un poco su jugabilidad, 
este juego se basa en intentar escaparde los 7 circulos del infierno para que Dante (nuestro personaje) vuelva al mundo de los mortales.

*/
import processing.sound.*;

SoundFile player;
boolean spacecode,upcode,rightcode,rcode,tcode,ccode;
PImage sprite1,sprite2,sprite3, edad,fondo,titulo;                                             
int x=0, esp=120, sum=1, barras=10, vid=5, ini, level=2, creditos;
int vuel=0,poy, pox, poy2,perx=5, pery,ny=0, yc=0, tutorial,tix=645,tiy=132;            //declarar variables generales
float  gar=0, bar=40, posi, bon=1, dist, sub, cor, obs, xobs, yobs=600;     


PFont letra;
int posarriba []= new int[barras];                                      // array para la posicion x superior
//int posabajo []= new int[barras];                                       // array para la posicion x inferior
int posy []= new int[barras];                                           // array posicion en y


void setup(){
 // rectMode(CORNERS);
 size(1080,500);

    player= new SoundFile(this, "fondomusica.wav");
    fondo=loadImage("c703f972-cd50-4809-8a7a-b5d875c82e15 (2).jpg");     
    letra =loadFont("Monospaced.bold-48.vlw");                           
    titulo=loadImage("nether (2).png");                                        //cargar imagenes
    sprite1=loadImage("jugador1 (1).png");
    sprite2=loadImage("lava.png");
    sprite3=loadImage("columna.png");
    edad=loadImage("ESRB-E10.png");
    textFont(letra);
     
   
   
   for(int i=0; i<=barras-1; i++){
      posarriba[i]=x;                                                        //asignar los datos al array
      x+=esp;                          
    }
     x=2*esp/3;
   /*  for(int i=0; i<=barras-1; i++){                                         //definir la posicion x del vertice inferior
      posabajo[i]=x;
      x+=esp;
    }*/
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
         posy[i]=int(random(posy[i-1]-50, 420));                          //condiciones para la altura
      }
     if(posy[i-1]<=100 ){
         posy[i]=int(random(100, 150));
      }
    }  //else
     } //for
 pery= posy[0]-60;

}  // cerra setup




void draw(){
   player.amp(0.2);
   image(fondo,0,0);
   
   if (ini==0){
   player.pause();                      //pausar musica                                                    
   }
   else if(ini!=0){                                        //reproducir musica
     if(!player.isPlaying()){
       player.stop();
       player.play(); 
     } 
                     
   }
   
   if(level==1 && creditos!=1){
     copy(titulo,14,76,215,44,225,100,tix,tiy);                             //titulo inicial del juego
     textSize(20);
   }

   if(level>=8){
     fill(255);
     textSize(50);
     text("FELICIDADES GANASTE", 50, 200);                                //pantalla de trinfu
     text("SALISTE DEL INFIERNO", 250, 250); 
     if(spacecode && tutorial!=1 && creditos!=1){                  // reiniciar el juego
     ini=1;
     level=1;
     vid=5;
     }
   }
  
   if(level>=2){
     tix=0;
     tiy=0;
    }
   
 /////////____________INICIAR JUEGO___________//////////////////

  if(vid>0 && level<=7){
   if(spacecode && tutorial!=1  && creditos!=1){     //INICAR EL JUEGO
     ini=1;
    }
    
    inicio();

    if(ini==1 && level<=7){                           //INICIAR EL FUNCIONAMIENTO DEL JUEGO
       tix=0;
       tiy=0;
       barras();
       mov(); 
/////___________pasar nivel__________________//////// 
      
      if(vuel>=3 && perx>posarriba[0] && pery+60==poy){      // PASAR DE NIVEL
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
 
  /////////////________NIVELES MAYORES O IGUALES A 2_________/////////////
    if(level>=2 && level<=7){
        level2(); 
      }
 
 //////////////________LAVA_____________/////////////////////////////
    copy(sprite2,0,13,32,32,0,430,600,120);                                //MOSTRAR LA LAVA
    copy(sprite2,0,13,32,32,500,430,600,120);

 }
  
 else{
   menu();
}
}
  else{
   //////___________GAME OVER__________________////////
  if(level<=7){
    fill(255);
    textSize(60);                                                                                  //MOSTRAR PANTALLA DE FIN DEL JEUGO 
    text("GAME OVER", 400, 300);
    textSize(30);
    text("PRESIONA R PARA REINICIAR", 340, 400);
     
    if(rcode && tutorial!=1 && creditos!=1){                  // reiniciar el juego
       ini=1;
       level=1;
       vid=5;
      }
      
   ini=0;
   }
  } //else 
} //cerrar void



void keyPressed(){

  if(key==CODED)
    keycontrol(keyCode, true);
  
  if(key != CODED)
    keycontrol(key, true);
}
void keyReleased(){

  if(key==CODED)
    keycontrol(keyCode, false);
  
 if(key != CODED)
   keycontrol(key, false);
}

void keycontrol(int k, boolean b){
   switch(k){
     case UP:
       upcode=b;
     break;
     
     case RIGHT:
       rightcode=b;
     break;
     
     case ' ':
       spacecode=b;
     break;
     
     case 'r':
       rcode=b;
     break;
     
     case 'R':
       rcode=b;
     break;
     
     case 'T':
       tcode=b;
     break;
     
     case 't':
       tcode=b;
     break;
     
     case 'C':
       ccode=b;
     break;
     
     case 'c':
       ccode=b;
     break;
     default:
     break;
  }
}

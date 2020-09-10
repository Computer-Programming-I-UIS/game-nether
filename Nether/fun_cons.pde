void cora(){
   
  for(int i=0; i<vid; i++){
     noStroke(); 
     fill(255, 0, 0);
     ellipse(1065+cor,20,10,10);                                  //DIBUJAR LOS CORAZONES DE VIDA 
     ellipse(1055+cor,20,10,10);
     triangle(1049+cor,20, 1070+cor ,20 , 1060+cor ,32); 
     cor-=30;
   }  

  if(vuel>=28 && dist>=40 && sum!=0){
    noStroke();
    fill(255, 0, 0);
    ellipse(posarriba[8]+25,posy[8]-30,10,10);
    ellipse(posarriba[8]+15,posy[8]-30,10,10);                                         //DIBUJAR EL CORAZON FINAL 
    triangle(posarriba[8]+9,posy[8]-30, posarriba[8]+30 ,posy[8]-30 , posarriba[8]+20, posy[8]-15); 
   }
 
  dist=dist(perx,pery,posarriba[8]+25, posy[8]-30);                                   //DISTANCIA ENTRE EL JUGADOR Y EL CORAZON
 
 if(vuel>=28 && dist<=40 && sum!=0){
   vid+=1;                                                                            //OBTENER EL CORAZON
   sum=0;
 }
}

void perder(){
       if(pery>=height-60 || perder==1){                     // CUADNO EL PERSONAJE LLEGE A LA LAVA, PIERDA 
         vid--;
         vuel=0;
         pery=posy[0]-60;                    
         perx=posarriba[0]+5;
         bar=2;
         x=0;
         gar=0;
         perder=0;
        
         for(int i=0; i<=barras-1; i++){
          posarriba[i]=x;                                                        //asignar los datos al array
          x+=esp;
          
        }
       
        if(vid<=0){
         for(int i=0; i<=barras-1; i++){          
           resta(i);
             do{
             posy[i]=int(random(posy[rest]-50,posy[rest]+50));   
           }
           while( posy[i]<100 || posy[i]>420);
      
       }
     }
    
     pery=posy[0]-60;                     //uso alt
     perx=posarriba[0]+5; 
   }
   println(disbol);
 }

 
void creditos(){
  textSize(30);
  text("CREDITOS", 300,100);                                          //HACER LOS CREDITOS
  textSize(20);
  text("https://www.youtube.com/watch?v=K2iC1aCPbKA", 150, 150);
  text("Heart of Courage/Two Steps From Hell",150,170);
  text("MUSICA DE FONDO", 150, 205);
  text("November_Seventeen",150,290);
  text("IMAGEN DE FONDO", 150, 315);
  text("https://www.shutterstock.com/es/image-vector/", 150, 250);
  text("seamless-background-landscape-infernal-hot-cave-1500940460", 150,270);
  fill(135);
  rect(2,475,20,20,5);
  fill(255); 
  textSize(12);
  text("R  para regresar", 5,490);
 
  }
 
void tutorial(){
     tix=0;
     tiy=0;
     fill(150);
     stroke(0,0, 0);
     rect(100,100,40,40,10);
     rect(100,150,100,40,10);                                       //REPRESENTAR LOS CONTROLES Y SU FUNCION
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
     text("INICIO", 208,185);
     text("SALTAR", 145,230);
     text("IR A LA DERECHA", 145,285);
     text("CONTROLES", 350,80);
     fill(0);
     textSize(30);
     text("SPACE",102,181);
     copy(sprite1,0,0,64,64,100,400,45,60);
  }

void inicio(){
  if(spacecode && tutorial!=1  && creditos!=1){     //INICAR EL JUEGO
     ini=1;
    } 
  if(rcode){                      //PRESIONAR R PARA REGRESAR
    ini=0;
    tutorial=0;
    creditos=0;
  }
  if(ccode && tutorial==0){                     //PRESIONAR C PARA CREDITOS
    creditos=1;
  }
  if(creditos==1 && ini==0 ){
      creditos();
  }
    
  if(tcode && creditos==0){
    tutorial=1;  
  }
  if(tutorial==1 && ini!=1 ){ 
    tutorial();
  } 
  else{
    tix=645;                                            //PONER EL TITULO CADA VEZ QUE SE REGRESAR AL MENU EN NIVEL 1
    tiy=132;
  }
}

void menu(){
  if(tutorial!=1 && creditos!=1){
    copy(edad,0,0,450,600,50,400,45,60);
    textSize(40);
    fill(255);
    
    if(level==1){
    textSize(50);
    text("PRESIONE ESPACIO PARA INICIAR", 90, 335);                        //MOSTRAR MENU 
    textSize(25);
    text("PRESIONE LA TECLA T PARA VER LOS CONTROLES",210,395);
    text("PRESIONE LA TECLA C PARA VER LOS CREDITOS",220,420);
    }
   
    if(level>=2 ){
    textSize(45);
    text("FELICIDADES BIENVENIDO AL CIRCULO: ",40,203);    
    text("PRESIONE ESPACIO", 300, 300);
    text(level, 1010, 200);
    textSize(25);
    text("PRESIONE LA TECLA T PARA VER LOS CONTROLES",165,360);
    text("PRESIONE LA TECLA C PARA VER LOS CREDITOS",165,400); 
  }
 }
}

void resta(int i){
       if(i-1<0){
        rest=barras-2;
        }
        if(i-1>=0){
        rest=i-1;
        }
  
}
void bolas(){
  for(int i=0; i<=4; i++){
    bol=int(random(0,200));
    disbol=dist(perx+22, pery+30, bolasx[i], bolasy[i]);
    if(disbol<=20){
      perder=1;
    }
    if(bolasy[i]<=0 && bol==16 && perx>60){
      bolasx[i]=int(random(perx-50, perx+200));
      bolasy[i]=600;
    }
    if(bolasy[i]>-10 && perx>60){
    ellipse(bolasx[i], bolasy[i],20,20); 
    bolasy[i]-=2;
    }
    if(perx<60){
     bolasy[i]=-20; 
    }
  }
  println(bolasy[1]);
  
}

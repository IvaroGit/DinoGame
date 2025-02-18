Dino p1;
spike[] spikes = new spike[2];


PImage loadrunframe;
PImage loadduckframe;
PImage öken;
PImage retry;

PFont font;
int runT = 255;
int duckT = 255;
int Dinoframeruncounter;
int Dinoframeduckcounter;
int score = 0;

int endscreeno = 0;
int endscreento = 0;

float spikedistance = 1000;



boolean Gameover = false;



void setup(){
  
  frameRate(120);
  size(1100,500);
  öken = loadImage("ökenfrfr.jpg");
  retry = loadImage("retry.png");

 

 p1 = new Dino(200,height - 50 ,50,50);
 for(int i = 0; i<spikes.length; i++){
 spikes[i] = new spike( i * spikedistance + 1000,height - 80,80,80);
 }

}    // setup

void draw(){
if(mouseX >= width/2 - 30 && mouseX<=width/2 + 30 && mouseY>= height/2+150 && mouseY<= height/2+210 && mousePressed ){
  retry = loadImage("retrypressed.png");
}else { retry = loadImage("retry.png");}
  
if(Gameover == false){
  score += 1;
  
}

 
   
     
  background(öken);
  
  fill(0);
  textSize(20);
 text("Score:"  + score,100,100);
   for(int i = 0; i<spikes.length; i++){
  if(spikes[i].spikex < -(80)){
    spikes[i].spikex = i * random(3) * spikedistance + 2000;
   }
   }


 //animation
if (Dinoframeruncounter >= 0 && Dinoframeruncounter < 11){
  loadrunframe = loadImage("Dino1run.png");
}else if (Dinoframeruncounter  >= 11 && Dinoframeruncounter < 21){
  loadrunframe = loadImage("Dino2run.png");
}  else if ( Dinoframeruncounter >= 21 && Dinoframeruncounter < 31){
  loadrunframe = loadImage("Dino3run.png");
} else if ( Dinoframeruncounter >= 31 && Dinoframeruncounter < 41){
  loadrunframe = loadImage("Dino4run.png");
} else if ( Dinoframeruncounter >= 41 && Dinoframeruncounter < 51){
  loadrunframe = loadImage("Dino5run.png");
} else if( Dinoframeruncounter >= 51 && Dinoframeruncounter <= 60){
loadrunframe = loadImage("Dino6run.png"); }
tint(255,runT);
image(loadrunframe,p1.x,p1.y,50 * p1. sizeM,50 * p1.sizeM);

if(Dinoframeduckcounter >= 0 && Dinoframeduckcounter <11){
  loadduckframe = loadImage("Dino1duck.png");
} else if ( Dinoframeduckcounter >= 11 && Dinoframeduckcounter < 21){
  loadduckframe = loadImage("Dino2duck.png");
} else if( Dinoframeduckcounter >= 21 && Dinoframeduckcounter < 31){
  loadduckframe = loadImage("Dino3duck.png");
} else if (Dinoframeduckcounter >= 31 && Dinoframeduckcounter < 41){
  loadduckframe = loadImage("Dino4duck.png");
}else if(Dinoframeduckcounter >= 41 && Dinoframeduckcounter < 51){
  loadduckframe = loadImage("Dino5duck.png");
} else if ( Dinoframeduckcounter >= 51 && Dinoframeduckcounter<= 60){
  loadduckframe = loadImage("Dino6duck.png");
}
  tint(255,duckT);
  image(loadduckframe,p1.x,p1.y,62 * p1.sizeM,40 * p1.sizeM);
 

  if(p1.ducking==false){
  Dinoframeruncounter = Dinoframeruncounter +1;
  Dinoframeduckcounter = 0;
  duckT = 0;
  }else{Dinoframeruncounter = 0;
  Dinoframeduckcounter = Dinoframeduckcounter +1;
  duckT = 255;
  }
  

  if(Dinoframeruncounter>60){
    Dinoframeruncounter=1;
  }
  if(Dinoframeduckcounter>60){
    Dinoframeduckcounter=1;
  }
 
    if(p1.ducking == true){
      runT = 0;
    }else{runT= 255;
    }
      
    
  p1.display();
  p1.rise();
  p1.fall();
  p1.maxjump();
  p1.landed();
  p1.duck();
   for(int i = 0; i<spikes.length; i++){
  spikes[i].make();
  spikes[i].move();
   }  

  //collision

  
     for(int i = 0; i<spikes.length; i++){
       if( spikes[i].spikex <= p1.x + p1.w && spikes[i].spikex >= p1.x && spikes[i].spikey  <= p1.y + p1.h){
         Gameover = true;  }
  
     }
  
   

 
   if(p1.h == 40 * p1.sizeM&& p1.falling == false && p1. rising == false){
     p1.y = height - 40 * p1.sizeM;
   }
   
   if(Gameover == true){
     endscreeno = 200;
     endscreento = 255;
  fill(255,endscreeno);
  rect(0,0,width,height);

  fill(0,endscreento);
  textSize(100);
 
   text("Game Over",width/2 - 250,height/2);
   textSize(60);
   text("Score: "+score,width/2 - 100,height/2 + 100);

   image(retry,width/2 - 30,height/2 + 150,60,60);
   }else{
     endscreeno = 0;
     endscreento = 0;
   }
textSize(20);
      fill(255,0,0);
    text("SPACE to jump, DOWN key to duck",width/2-100,50);
}   //draw

void keyPressed(){

      
  if(key==' ' && p1.rising == false && p1.falling == false && p1.ducking == false && p1.topAirtime == 0){
    p1.rising = true;
    p1. maxjumpy =p1. y - p1.jumpheight;
    
  }
    if(keyCode==DOWN){
     p1. ducking = true;
     
    }else{ p1.ducking = false;}
    
    
}  // void keypressed

void keyReleased(){
  if((keyCode==DOWN)&&(Gameover ==false)){
    p1. ducking = false;
  
}


}
void mouseReleased(){
  if(Gameover){

       for(int i = 0; i<spikes.length; i++){
        if(mouseX >= width/2 - 30 && mouseX<=width/2 + 30 && mouseY>= height/2+150 && mouseY<= height/2+210 ){
     spikes[i].spikex = i * random(3) * 1000 + 1000;
     Gameover = false;
     score = 0;
     p1.ducking = false;
        }
         }
       }
}

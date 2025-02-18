class spike{
  
 
  PImage cactus;
  float spikex;
  int spikey;
  int spikew;
  int spikeh;
  
  spike( float  startspikex, int startspikey, int startspikew, int startspikeh){
    spikex = startspikex;
    spikey = startspikey;
    spikew = startspikew;
    spikeh = startspikeh;
     cactus = loadImage("cactusfr.png");

  }
  void make(){



 noFill();
 noStroke(); 

    rect(spikex,spikey,spikew,spikeh);
       tint(255,255);
    image(cactus,spikex,height - 100,100,100);
 
    
  }
  void move(){
    if(Gameover == false){
    spikex = spikex - 8;
    }
  }
}
  
  
    
  
   

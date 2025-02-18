class Dino{
  
  int x;
  int y;
  
  int w;
  int h;  
   int topAirtime;
  int sizeM = 2;
  
  
  int jumpheight;  
  int maxjumpy;
  int fallspeed;
  int jumpspeed;
  
  boolean rising;
  boolean falling;
  boolean ducking;
  
  //constructor
  Dino(int startX,int startY, int startW, int startH){
    
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    
    jumpheight = 200;
    maxjumpy = y - jumpheight;
    
    jumpspeed = 7;
    fallspeed = 7;
    
    rising = false;
    falling = false;
  }
  
  void display(){
 fill(0,0,0,0);
 noStroke();
    rect(x,y,w* p1.sizeM,h * p1.sizeM);
    }
    
    void rise(){
      if(rising == true){
        y = y - jumpspeed;
      }
    }
    void fall(){
      if(falling == true){
        y = y +fallspeed;
    }
}


   void maxjump(){
     if (y <= maxjumpy){  
       topAirtime = topAirtime +1;
       rising = false;
       falling = false;
     }else{topAirtime = 0;
     }
     if(topAirtime >= 15){
       falling = true;

     
      
     }
   }
   
   void landed(){
     if(y >=  height - h){
     falling = false;
     y = height - h;
     }
   }
   
   void duck(){
     if(ducking == true){
       h = 40 * sizeM;
       w = 62 * sizeM;
       rising = false;
       falling = true;
       fallspeed = 15;
     }
     if(ducking == false){
       h = 50 * sizeM;
       w = 50 * sizeM;
       fallspeed = 7;
     }
    
}
}

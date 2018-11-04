class Graphism{
  
  PImage scene;
  PImage rang9;
  PImage rang8;
  PImage rang7;
  PImage rang6;
  PImage rang5;
  PImage rang4;
  PImage rang3;
  PImage rang2;
  PImage rang1;
  
  Graphism(){
    
    scene = loadImage("assets/sprites/scene.jpg");
    rang9 = loadImage("assets/sprites/public/9.png");
    rang8 = loadImage("assets/sprites/public/8.png");
    rang7 = loadImage("assets/sprites/public/7.png");
    rang6 = loadImage("assets/sprites/public/6.png");
    rang5 = loadImage("assets/sprites/public/5.png");
    rang4 = loadImage("assets/sprites/public/4.png");
    rang3 = loadImage("assets/sprites/public/3.png");
    rang2 = loadImage("assets/sprites/public/2.png");
    rang1 = loadImage("assets/sprites/public/1.png");
    
    
  }
  
  void draw(){
    
    image(scene, 0, 0);
    
    if(scoreManager.multiplier < 7){
    image(rang9, 0, 0);
    }else{
      image(rang9, 0, sin(frameCount));
    }
    
    image(rang8, 0, 0);
    
    if(scoreManager.multiplier < 7){
    image(rang7, 0, 0);
    }else{
      image(rang7, 0, sin(frameCount));
    }
    
    image(rang6, 0, 0);
    
    if(scoreManager.multiplier < 7){
    image(rang5, 0, 0);
    }else{
      image(rang5, 0, sin(frameCount));
    }
      
    image(rang4, 0, 0);
    
    if(scoreManager.multiplier < 7){
    image(rang3, 0, 0);
    }else{
      image(rang3, 0, sin(frameCount));
    }
    
    image(rang2, 0, 0);
    
    if(scoreManager.multiplier < 7){
    image(rang1, 0, 0);
    }else{
      image(rang1, 0, sin(frameCount));
    }
  }
}

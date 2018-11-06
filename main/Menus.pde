class Menus{

    PImage menu;
    PImage end;

    boolean outroShown = false;

    float theta = 0.0;
    
    Menus(){
        menu = loadImage("assets/sprites/menuBBO.png");
        end = loadImage ("assets/sprites/Bravo.png");
        //fail = loadImage ("assets/sprites/fail.png");
    }

    void draw(){

        theta += 0.2;
    
        if(playing == false && !hasGameEnded) image(menu, 0, 0);

        if(outroShown == true){
            // translate(width/2, height/2);
            // scale(1.5 + (sin(theta)));
            image(end, 0, 0);
            // scale(1);
            // translate(-width/2, -height/2);
        } 

    }

    void showOutro(){
        outroShown = true;
        soundManager.stopSound("music");
        soundManager.loopSound("outro");
    }

}
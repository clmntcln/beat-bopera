class Menus{

    PImage menu;
    PImage end;

    boolean outroShown = false;
    
    Menus(){
        menu = loadImage("assets/sprites/menuBBO.png");
        end = loadImage ("assets/sprites/Bravo.png");
        //fail = loadImage ("assets/sprites/fail.png");
    }

    void draw(){
    
        if(playing == false && !hasGameEnded) image(menu, 0, 0);

        if(outroShown == true){
            image(end, 0, 0);
        } 

    }

    void showOutro(){
        outroShown = true;
        soundManager.stopSound("music");
        soundManager.loopSound("outro");
    }

}
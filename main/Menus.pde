class Menus{

    PImage menu;
    
    Menus(){
        menu = loadImage("assets/sprites/menuBBO.png");
        //bravo = loadImage ("assets/sprites/Bravo.png");
        //fail = loadImage ("assets/sprites/fail.png");
    }

    void draw(){
    
        if(hasGameStarted == false) image(menu, 0, 0);

    }

}
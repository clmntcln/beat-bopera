class Note{

    PVector pos;

    Note(PVector origin){
        pos = origin;

    }

    void setPos(float x, float y){
        pos.x = x;
        pos.y = y;
    }

    void drawNote(){

        ellipse(pos.x, pos.y, 10, 10);
        fill(255);
        
    }

}
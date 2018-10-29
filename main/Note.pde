class Note{

    PVector pos;
    int scoreValue = 10;

    Note(float originX, float originY){
        pos = new PVector(originX, originY);

    }

    void setPos(float x, float y){
        pos.x = x;
        pos.y = y;
    }

    void draw(color c){

        fill(c);
        ellipse(pos.x, pos.y, 40, 40);
        
    }

}
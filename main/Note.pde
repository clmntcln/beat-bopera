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

    void draw(){

        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 30, 30);
        
    }

}
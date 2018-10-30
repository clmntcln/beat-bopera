class ScoreManager{

    int chain = 1;
    int multiplier = 1;
    int score = 0;
    int scoreIncrement = 10;

    ScoreManager(){

    }

    void add(int value){

        score += value * multiplier;

    }

    void setMultiplier(int value){
        this.multiplier = value;
    }

    void setChain(int value){
        this.chain = value;
    }

    void draw(){
        fill(255);
        rect(0, 0, 100, 50);
        rect(0, 50, 70, 30);

        fill(0);
        textSize(20);
        text(score, 15, 33);
        
        textSize(16);
        text("x"+this.multiplier, 15, 70);
    }

}

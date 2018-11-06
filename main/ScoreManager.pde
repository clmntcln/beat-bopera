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

    void checkChain(){
        if(IsPowerOfTwo(this.chain)){
            this.setMultiplier(this.chain);
            background.addFeedback();
        } 
    }

    void draw(){

        fill(0);
        textAlign(RIGHT);
        textSize(40);
        text(score, 170, 55);
        
        textSize(22);
        textAlign(LEFT);
        
        if(multiplier > 7){
            fill(126,51,0);
        } else if(multiplier > 15){
            fill(206);
        } else if(multiplier > 31){
            fill(255,215,0);
        }
        
        text("x"+this.multiplier, 25, 103);
    }

}

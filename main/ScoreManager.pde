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
        //fill(255);
        //rect(0, 0, 100, 50);
        //rect(0, 50, 70, 30);

        fill(0);
        textSize(40);
        text(score, 59, 55);
        
        textSize(22);
        text("x"+this.multiplier, 40, 103);
        
        if(multiplier > 7){
          fill(126,51,0);
          textSize(22);
          text("x"+this.multiplier, 40, 103);
        }
        
        if(multiplier > 15){
          fill(206);
          textSize(22);
          text("x"+this.multiplier, 40, 103);
        }
        
        if(multiplier > 31){
          fill(255,215,0);
          textSize(22);
          text("x"+this.multiplier, 40, 103);
        }
    }

}

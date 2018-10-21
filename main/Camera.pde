class Camera{
    
    boolean shaking = false;
    float shakeTimer = 0;
    //Durée en secondes
    float shakeDuration = 0.4;

    Camera(){

    }

    void draw(){
        
        if(this.shaking){

            this.shakeTimer += 1.0/60.0; //Division par 60 pour avoir l'incrément par frame

            float shakeX = random(-2, 2);
            float shakeY = random(-2, 2);

            translate(shakeX, shakeY);

            if(this.shakeTimer > shakeDuration){
                println("Stop shaking:" + this.shakeTimer);
                this.shaking = false;
                this.shakeTimer = 0;
            }
        }

    }

    void shake(){
        println("Shake");
        this.shaking = true;
        this.shakeTimer = 0;
    }

}
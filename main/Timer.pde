class Timer{

    boolean active;
    float counter = 0;
    float duration = 0;
    Callback onEnded;

    Timer(float d, boolean auto, Callback onEnded){

        this.active = auto;
        this.duration = d;
        this.onEnded = onEnded;

        if(auto) start();

    }

    void start(){
        this.active = true;
    }

    void update(){

        if(this.active){

            this.counter += 1.0/60.0;

            if(this.counter > this.duration){
                
                this.active = false;   
                this.counter = 0;
                this.onEnded.call();

            }

        }

    }

}
class CrowdFeedback{

    String content;
    String soundName;
    PVector pos = new PVector(300, 300);
    float dif = -10;
    float duration = 0;
    float incr = 0;

    CrowdFeedback(String content, String soundName, float duration){

        this.content = content;
        this.soundName = soundName;
        this.incr = this.dif / duration / 60;

        soundManager.playSound(soundName);
        
    }

    void draw(){

        pos.y += this.incr;

        text(this.content, this.pos.x, this.pos.y);

    }

}
class CrowdFeedback{

    String text;
    String soundName;

    CrowdFeedback(text, soundName){
        this.text = text;
        this.soundName = soundName;

        soundManager.playSound(soundName);
        //Load sound
        //Play sound
    }

    void draw(){
        //Draw text
    }

}
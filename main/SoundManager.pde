class SoundManager{

    PApplet context;

    SoundFile music;
    SoundFile poum;
    SoundFile tchack;

    Map<String, SoundFile> soundsList = new HashMap<String, SoundFile>();

    SoundManager(PApplet context){

        this.context = context;

        music = new SoundFile(context, "assets/music.wav");
        //music.play();

    }

    void load(String name, String path){

        SoundFile newSound = new SoundFile(this.context, path);

        soundsList.put(name, newSound);

    }

    void setSoundVolume(String soundName, float value){

        SoundFile sound = soundsList.get(soundName);

        sound.amp(value);

    }

    void playSound(String soundName){

        SoundFile sound = soundsList.get(soundName);

        sound.play();

    }

    void loopSound(String soundName){

        SoundFile sound = soundsList.get(soundName);

        sound.loop();

    }

    void stopSound(String soundName){

        SoundFile sound = soundsList.get(soundName);

        sound.stop();

    }

}

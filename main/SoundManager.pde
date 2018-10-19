class SoundManager{

    PApplet context;

    SoundFile music;
    SoundFile poum;
    SoundFile tchack;

    Map<String, SoundFile> soundsList = new HashMap<String, SoundFile>();

    SoundManager(PApplet context){

        this.context = context;

        music = new SoundFile(context, "assets/music.wav");
        //poum = new SoundFile(context, "assets/poum.wav");
        //tchack = new SoundFile(context, "assets/tchack.wav");

        //Load sounds
        //music.play();

    }

    void load(String name, String path){

        SoundFile newSound = new SoundFile(this.context, path);

        soundsList.put(name, newSound);

    }

    void playSound(String soundName){

        SoundFile sound = soundsList.get(soundName);

        sound.play();

    }

}
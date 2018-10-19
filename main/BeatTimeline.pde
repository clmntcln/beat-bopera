class BeatTimeline{
    int id;
    ArrayList<Note> notes = new ArrayList<Note>();

    PVector pos;
    PVector spawnPos;

    int width;

    float speed;

    boolean inputPressed = false;

    String soundName;

    BeatTimeline(int givenId, float x, float y, int givenWidth, float givenSpeed, String soundName, String soundPath){

        this.id = givenId;
        this.pos = new PVector(x, y);
        this.width = givenWidth;
        this.spawnPos = new PVector( pos.x + ((float)this.width/2), -40);
        this.speed = givenSpeed;

        this.soundName = soundName;

        soundManager.load(soundName, soundPath);

    }

    void spawnNote(){

        notes.add(new Note(spawnPos.x, spawnPos.y));

    }

    void draw(){

        drawBackground();

        drawZone();

        drawNotes();

    }

    void drawBackground(){

        fill(255);
        rect(pos.x, pos.y, 80, height);
        line(pos.x + 40, 0, pos.x + 40, height);

    }

    void drawNotes(){
        for(int i = 0; i < notes.size(); i++){
            Note note = notes.get(i);
            note.setPos(note.pos.x, note.pos.y + speed);
            note.draw();

            //if offscreen, remove from array
            if(note.pos.y > height){
                notes.remove(i);
                scoreManager.setMultiplier(1);
                soundManager.playSound("fail");
            } 
        }
    }

    void drawZone(){

        fill(130);

        if(inputPressed) fill(100);

        rect(pos.x, height - 90, 80, 80);

    }

    void checkForNote(){

        for(int i = 0; i < notes.size(); i++){
            Note note = notes.get(i);
            
            if(note.pos.y > height - 90 && note.pos.y < height - 10){
                notes.remove(i);
                soundManager.playSound(this.soundName);
                scoreManager.add(note.scoreValue);
                scoreManager.setMultiplier(scoreManager.multiplier + 1);
            }
        }

    }

    void onInputPressed(){

        inputPressed = true;

        checkForNote();

    }

    void onInputReleased(){

        inputPressed = false;

    }

}

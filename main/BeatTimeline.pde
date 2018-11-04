class BeatTimeline{

    int id;
    ArrayList<Note> notes = new ArrayList<Note>();

    PVector pos;
    PVector spawnPos;

    int width;

    float speed;

    boolean inputPressed = false;

    String soundName;

    color noteColor;

    PImage playerIdle;
    PImage playerActive;

    float zoneStart = height - 154;
    float zoneH = 100;

    BeatTimeline(int givenId, float x, float y, int givenWidth, float givenSpeed, String soundName, String soundPath, color noteColor, String folder){

        this.id = givenId;
        this.pos = new PVector(x, y);
        this.width = givenWidth;
        this.spawnPos = new PVector( pos.x + ((float)this.width/2), -40);
        this.speed = givenSpeed;

        this.noteColor = noteColor;

        this.soundName = soundName;

        soundManager.load(soundName, soundPath);

        playerIdle = loadImage("assets/sprites/" + folder + "/idle-ph.png");
        playerActive = loadImage("assets/sprites/" + folder + "/active-ph.png");
       
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

        fill(255, 255, 255, 150);
        rect(pos.x, pos.y, 80, height);
        stroke(150, 150, 150);
        strokeWeight(1);
        line(pos.x + 40, 0, pos.x + 40, height);

    }

    void drawNotes(){
      
        for(int i = 0; i < notes.size(); i++){
            Note note = notes.get(i);
            note.setPos(note.pos.x, note.pos.y + speed);
            note.draw(noteColor);

            //if offscreen, remove from array
            if(note.pos.y > height){
                notes.remove(i);
                scoreManager.setMultiplier(1);
                scoreManager.setChain(1);
                soundManager.playSound("fail");
                camera.shake();
            }
        }
        
    }

    //Dessiner la zone
    void drawZone(){

        if(inputPressed){
            image(playerActive, pos.x - 48, height - 162, 162, 162);
        } else{
            image(playerIdle, pos.x - 48, height - 162, 162, 162);
        }
   
        strokeWeight(0);

        fill(255, 255, 255, 150);

        //Hitbox
        // if(inputPressed) fill(255, 255, 255, 200);
        // rect(pos.x, this.zoneStart, this.width, this.zoneH);

        fill(255, 255, 255, 0);

        if(inputPressed) fill(noteColor, 150);

        strokeWeight(4);
        stroke(noteColor);
        ellipse(pos.x + (this.width/2), this.zoneStart + (this.zoneH/2), 40, 40);

        strokeWeight(0);

    }

    //Est-ce qu'une note est dans la zone ?
    void checkForNote(){

        for(int i = 0; i < notes.size(); i++){
            Note note = notes.get(i);
            
            if(note.pos.y > this.zoneStart && note.pos.y < (this.zoneStart + this.zoneH)){

                notes.remove(i);
                soundManager.playSound(this.soundName);
                scoreManager.add(note.scoreValue);
                scoreManager.setChain(scoreManager.chain + 1);

                if(IsPowerOfTwo(scoreManager.chain)) scoreManager.setMultiplier(scoreManager.chain);
            }
        }

    }

    //Quand le joueur appuit
    void onInputPressed(){

        inputPressed = true;

        checkForNote();

    }

    //Quand le joueur relâche
    void onInputReleased(){

        inputPressed = false;

    }

}

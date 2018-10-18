class BeatTimeline{
    int id;
    ArrayList<Note> notes = new ArrayList<Note>();

    PVector pos;
    PVector spawnPos;

    int width;

    float speed;

    BeatTimeline(int givenId, float x, float y, int givenWidth, float givenSpeed){

        this.id = givenId;
        this.pos = new PVector(x, y);
        this.width = givenWidth;
        this.spawnPos = new PVector( pos.x + ((float)this.width/2), -40);
        this.speed = givenSpeed;

    }

    void spawnNote(){

        notes.add(new Note(spawnPos.x, spawnPos.y));

    }

    void draw(){

        fill(255);
        rect(pos.x, pos.y, 80, height);
        line(pos.x + 40, 0, pos.x + 40, height);
        ellipse(spawnPos.x, spawnPos.y, 30, 30);

        for(int i = 0; i < notes.size(); i++){
            Note note = notes.get(i);
            note.setPos(note.pos.x, note.pos.y + speed);
            note.draw();
        }

    }

}

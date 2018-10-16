class BeatTimeline{
    int id;
    ArrayList<Note> notes = new ArrayList<Note>();

    PVector pos;
    PVector spawnPos;

    int width;

    Note note1;

    BeatTimeline(int givenId, float x, float y, int givenWidth){

        this.id = givenId;
        this.pos = new PVector(x, y);
        this.width = givenWidth;
        this.spawnPos = new PVector( pos.x + ((float)this.width/2), -40);

        note1 = new Note(spawnPos.x, spawnPos.y);

    }

    void spawnNote(){

        notes.add(new Note(spawnPos.x, spawnPos.y));

    }

    void draw(){

        fill(255);
        rect(pos.x, pos.y, 80, height);
        line(pos.x + 40, 0, pos.x + 40, height);
        ellipse(spawnPos.x, spawnPos.y, 30, 30);

        note1.setPos(note1.pos.x, note1.pos.y + 1);
        note1.draw();

    }

}

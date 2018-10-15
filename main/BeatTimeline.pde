class BeatTimeline{
    int id;
    ArrayList<Note> notes = new ArrayList<Note>();

    PVector spawnPos = new PVector(0, 0);

    BeatTimeline(int givenId){

        id = givenId;

    }

    void spawnNote(){

        notes.add(new Note(spawnPos));

    }

}
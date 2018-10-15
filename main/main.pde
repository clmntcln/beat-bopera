ScoreManager scoreManager;
InputManager inputManager;
Parser parser;

BeatTimeline tl;

void setup(){

    size(800, 400);

    scoreManager = new ScoreManager();
    inputManager = new InputManager();

    parser = new Parser();
    parser.loadSheet("assets/sheet.txt");
    parser.parseSheet();    

    tl = new BeatTimeline(0);

    //TODO: create timelines, give id

}

void draw(){

    //Convert BPM to global ticker
    //on tick, 

    //Move notes

    //detect input
    //if a note is inside an input zone (coordinates comparison) delete it, play sound, and add score
    //else reset score multiplier and play "fail" sound

}

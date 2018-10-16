ScoreManager scoreManager;
InputManager inputManager;
Parser parser;

BeatTimeline tl1;
BeatTimeline tl2;

void setup(){

    size(800, 500);

    scoreManager = new ScoreManager();
    inputManager = new InputManager();

    parser = new Parser();
    parser.loadSheet("assets/sheet.txt");
    parser.parseSheet();    

    tl1 = new BeatTimeline(0, width/2, 0, 80);
    tl2 = new BeatTimeline(0, (width/2) + 90, 0, 80);

}

void draw(){

    clear();
  
    background(150);

    tl1.draw();
    tl2.draw();

    //Convert BPM to global ticker
    //on tick

    //Move notes

    //detect input
    //if a note is inside an input zone (coordinates comparison) delete it, play sound, and add score
    //else reset score multiplier and play "fail" sound

}

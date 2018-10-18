ScoreManager scoreManager;
InputManager inputManager;
Parser parser;

BeatTimeline tl1;
BeatTimeline tl2;

float timeElapsed = 0;
int beatCounter = 0;
float beatInterval = 0;

float speed = 1;
float delay = 5;

void setup(){

    size(800, 500);

    scoreManager = new ScoreManager();
    inputManager = new InputManager();

    parser = new Parser();
    parser.loadSheet("assets/sheet.txt");
    //parser.parseSheet();    

    speed = (height / delay) / 60;

    tl1 = new BeatTimeline(0, width/2, 0, 80, speed);
    tl2 = new BeatTimeline(0, (width/2) + 90, 0, 80, speed);

    frameRate(60);

    //println(frameRate);

    beatInterval = 60 / parser.getBPM();

}

void draw(){

    timeElapsed = millis() / 1000.0;


    //println("Time elapsed:" + timeElapsed);

    if(beatCounter < parser.lines.length && timeElapsed > (beatCounter * beatInterval)){

        //Spawn note

        String line = parser.getLine(beatCounter);
        String col1 = parser.getCol(line, 0);
        String col2 = parser.getCol(line, 1);

        println(col1 + " " + col2);

        if(col1.equals("o")){
            tl1.spawnNote();
        } 
        
        if(col2.equals("o")){
            tl2.spawnNote();
        } 


        beatCounter++;
        

    }

    clear();
  
    background(150);

    tl1.draw();
    tl2.draw();

    //text("Time elapsed:" + timeElapsed, 0, 10);
    //text("Beat Interval:" + beatInterval, 0, 20);
    text("Beat counter:" + beatCounter, 0, 30);
    //text("Frame rate:" + frameRate, 0, 40);

    //Convert BPM to global ticker
    //on tick

    //Move notes

    //detect input
    //if a note is inside an input zone (coordinates comparison) delete it, play sound, and add score
    //else reset score multiplier and play "fail" sound

}

	
import java.util.Map;
import processing.sound.*;

ScoreManager scoreManager;
InputManager inputManager;
SoundManager soundManager;
Parser parser;

BeatTimeline tl1;
BeatTimeline tl2;

float timeElapsed = 0;
int beatCounter = 0;
float beatInterval = 0;

//Temps de délais donné au joueur entre l'apparition de la note et le moment où elle doit être appuyée
float delay = 3;

void setup(){

    size(1024, 720);
    frameRate(60);

    parser = new Parser();
    scoreManager = new ScoreManager();
    //inputManager = new InputManager();
    soundManager = new SoundManager(this);

    soundManager.load("fail", "assets/fail.wav");
    
    parser.loadSheet("assets/sheet.txt");

    float speed = (height / delay) / 60;

    tl1 = new BeatTimeline(0, width/2, 0, 80, speed, "poum", "assets/poum.wav");
    tl2 = new BeatTimeline(0, (width/2) + 90, 0, 80, speed, "tchack", "assets/tchack.wav");

    beatInterval = 60 / parser.getBPM();

    // SoundFile music = new SoundFile(this, "assets/music.wav");

    // music.play();

}

void draw(){

    timeElapsed = millis() / 1000.0;

    //Si une ligne existe pour le beat actuel dans la partition && que suffisamment de temps s'est écoulé depuis le dernier beat
    if(beatCounter < parser.lines.length && timeElapsed > (beatCounter * beatInterval)){

        //TODO : Ignorer la première ligne du fichier

        String line = parser.getLine(beatCounter);
        String col1 = parser.getCol(line, 0);
        String col2 = parser.getCol(line, 1);

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

    scoreManager.draw();

    Debug();

    //detect input
    //if a note is inside an input zone (coordinates comparison) delete it, play sound, and add score
    //else reset score multiplier and play "fail" sound

    //CHECK INPUT

}

//Event touche appuyée
void keyPressed(){

    if (key == 'o') {
        tl1.onInputPressed();
    }
    if (key == 'p') {
        tl2.onInputPressed();
    }

}

void keyReleased(){

    if (key == 'o') {
        tl1.onInputReleased();
    }
    if (key == 'p') {
        tl2.onInputReleased();
    }

}

void Debug(){

    fill(255);

    //text("Time elapsed:" + timeElapsed, 0, 10);
    //text("Beat Interval:" + beatInterval, 0, 20);
    text("Beat counter:" + beatCounter, 0, height - 30);
}
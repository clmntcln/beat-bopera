import java.util.Map;
import processing.sound.*;

ScoreManager scoreManager;
SoundManager soundManager;
Parser parser;
Camera camera;
Background background;
Menus menus;

BeatTimeline tl1;
BeatTimeline tl2;

boolean hasGameStarted = false;
boolean hasGameEnded = false;

float timeElapsed = 0;
float timePaused = 0;
int beatCounter = 0;
int noteCounter = 1;
float beatInterval = 0;
float noteInterval = 0;
float beatDivision = 4;

//Temps de délais donné au joueur entre l'apparition de la note et le moment où elle doit être appuyée
float delay = 1.5;

color c1 = color(225, 30, 44);
color c2 = color(218, 225, 30);

void setup(){

    size(1024, 640);
    frameRate(60);

    camera = new Camera();
    parser = new Parser();
    background = new Background();
    scoreManager = new ScoreManager();
    soundManager = new SoundManager(this);
    menus = new Menus();

    //Load sounds
    soundManager.load("intro", "assets/sounds/intro.wav");
    soundManager.load("fail", "assets/sounds/fail.wav");
    soundManager.load("man", "assets/sounds/oh_yeah.wav");
    soundManager.load("women", "assets/sounds/yeay.wav");
    soundManager.load("applause", "assets/sounds/yeay.wav");
    soundManager.load("outro", "assets/sounds/yeay.wav");
    
    parser.loadSheet("assets/sheet.txt");

    float speed = (height / delay) / 60;

    tl1 = new BeatTimeline(0, (width/2) + 90, 0, 80, speed, "bass_drum", "assets/sounds/bass_drum_1_short.wav", c1, "woman");
    tl2 = new BeatTimeline(0, (width/2) + 220, 0, 80, speed, "snare", "assets/sounds/snare_1_short.wav", c2, "man");

    beatInterval = 60 / parser.getBPM();
    noteInterval = beatInterval / beatDivision;

}

void draw(){

    if(hasGameStarted && !hasGameEnded){
        timeElapsed = (millis() / 1000.0) - timePaused;
    } else {
        timePaused = millis() / 1000.0;
    }

    // if( beatCounter >= parser.lines.length ){
    //     println("reset: " + parser.lines.length);
    //     beatCounter = 1;
    //     timeElapsed = 0;
    // }

    //Si une ligne existe pour le beat actuel dans la partition && que suffisamment de temps s'est écoulé depuis le dernier beat
    if(noteCounter < parser.lines.length && timeElapsed > (noteCounter * noteInterval)){

        //TODO : Ignorer la première ligne du fichier

        String line = parser.getLine(noteCounter);
        String col1 = parser.getCol(line, 0);
        String col2 = parser.getCol(line, 1);

        if(col1.equals("o")){
            tl1.spawnNote();
        } 
        
        if(col2.equals("o")){
            tl2.spawnNote();
        } 

        noteCounter++;

    }

    // if(timeElapsed > (noteCounter * noteInterval)){

    //     tl1.spawnNote();

    //     noteCounter++;

    //     //if(noteCounter % beatDivision)

    //     println(noteCounter % beatDivision);

    // }

    clear();
  
    background.draw();

    pushMatrix();
    
    camera.draw();

    tl2.draw();
    tl1.draw();

    popMatrix();

    scoreManager.draw();

    menus.draw();

    //Debug();


}

//Event touche appuyée
void keyPressed(){

    if (key == 'o') {
        tl1.onInputPressed();
    }
    if (key == 'p') {
        tl2.onInputPressed();
    }

    if (key == ' ' && !hasGameStarted) hasGameStarted = true;
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

    text("Time elapsed:" + timeElapsed, 10, height - 50);
    //text("Beat Interval:" + beatInterval, 0, 20);
    text("Note counter:" + noteCounter, 10, height - 30);
}

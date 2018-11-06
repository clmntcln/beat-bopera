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

boolean playing = false;
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

Timer endGameTimer;

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
    soundManager.load("music", "assets/music.wav");
    soundManager.load("intro", "assets/sounds/intro.wav");
    soundManager.load("fail", "assets/sounds/fail.wav");
    soundManager.load("applause", "assets/sounds/applause.wav");
    soundManager.load("oh_yeah", "assets/sounds/oh_yeah.wav");
    soundManager.load("yeay", "assets/sounds/yeay.wav");
    soundManager.load("outro", "assets/sounds/outro.wav");
    
    parser.loadSheet("assets/sheet.txt");

    float speed = (height / delay) / 60;

    tl1 = new BeatTimeline(0, (width/2) + 90, 0, 80, speed, "bass_drum", "assets/sounds/bass_drum_1_short.wav", c1, "woman");
    tl2 = new BeatTimeline(0, (width/2) + 220, 0, 80, speed, "snare", "assets/sounds/snare_1_short.wav", c2, "man");

    beatInterval = 60 / parser.getBPM();
    noteInterval = beatInterval / beatDivision;

    endGameTimer = new Timer(delay + 1.0, false, new OnGameEnded());

    soundManager.loopSound("intro");

}

void draw(){

    if(playing){
        timeElapsed = (millis() / 1000.0) - timePaused;
    } else {
        timePaused = millis() / 1000.0;
    }

    //Si une ligne existe pour le beat actuel dans la partition && que suffisamment de temps s'est écoulé depuis le dernier beat
    if(playing && noteCounter < parser.lines.length && timeElapsed > (noteCounter * noteInterval)){

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

    //End condition
    if(playing && noteCounter == parser.lines.length){
        //Start timer to endGame
        endGame();
    }

    endGameTimer.update();


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

void startGame(){
    playing = true;
    soundManager.stopSound("intro");
    soundManager.playSound("music");
}

void endGame(){
    println("End Game");
    hasGameEnded = true;
    playing = false;

    endGameTimer.start();
}

class OnGameEnded implements Callback{
    @Override
    void call(){
        println("OnGameEnded");
        menus.showOutro();
    }
}

//Event touche appuyée
void keyPressed(){

    if (key == 'o') {
        tl1.onInputPressed();
    }
    if (key == 'p') {
        tl2.onInputPressed();
    }

    if (key == ' ' && !playing) startGame();
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

    text("Time elapsed:" + timeElapsed, 10, height - 60);
    //text("Beat Interval:" + beatInterval, 0, 20);
    text("Note counter:" + noteCounter, 10, height - 30);
}

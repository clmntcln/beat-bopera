class Background{

    PImage scene;
  
	CrowdRow[] rows = new CrowdRow[9];

    ArrayList<CrowdFeedback> crowdFeedbacks = new ArrayList<CrowdFeedback>();

    float theta = 0;
  
    Background(){

        for(int i = 0; i < 9; i++){
            rows[i] = new CrowdRow("assets/sprites/public/" + (i + 1) + ".png");
        }
    
        scene = loadImage("assets/sprites/scene.jpg");
    
    }
  
    void draw(){

        theta += 0.02;
    
        image(scene, 0, 0);

        if(scoreManager.multiplier < 7) {
            
        } else {
            // for(int i = this.rows.length; i > 0; i--){
            //     this.rows[i - 1].pos.y = 0;
            // }
        }

        for(int i = this.rows.length; i > 0; i--){
            this.rows[i - 1].draw();
        }

        for(int f = 0; f < this.crowdFeedbacks.size(); f++){
            CrowdFeedback fb = crowdFeedbacks.get(f);
            fb.draw();
        }

    }

    void addFeedback(){

        crowdFeedbacks.add(new CrowdFeedback("GGS", "applause", 5, new CrowdFeedbackCallback()));

    }

    void removeFirstFeedback(){

        println("Remove first item");
        this.crowdFeedbacks.remove(0);

    }
}


class CrowdRow{

    PVector pos = new PVector(0, 0);
    PImage src;

    CrowdRow(String srcPath){
        this.src = loadImage(srcPath);
    }

    void draw(){
        image(this.src, pos.x, pos.y);
    }

}

class CrowdFeedbackCallback implements Callback
{
    @ Override
    void call()
    {
        println("-CrowdFeedbackCallback");
        background.removeFirstFeedback();
    }
}

class CrowdFeedback extends Timer{

    String content;
    String soundName;
    PVector pos = new PVector(300, 300);
    float dif = -10;
    float incr = 0;

    CrowdFeedback(String content, String soundName, float duration, Callback callback){
        super(duration, true, callback);

        this.content = content;
        this.soundName = soundName;
        this.incr = this.dif / this.duration / 60;

        pos.x += random(-10, 10);
        pos.y += random(-10, 10);

        soundManager.playSound(soundName);
        
    }

    void draw(){

        this.update();
        //pos.y += this.incr;

        text(this.content, this.pos.x, this.pos.y);

    }

}
class Background{

    PImage scene;
  
	CrowdRow[] rows = new CrowdRow[9];

    ArrayList<CrowdFeedback> crowdFeedbacks = new ArrayList<CrowdFeedback>();
    ArrayList<PImage> crowdFeedbackImages = new ArrayList<PImage>();

    float theta = 0.0;
  
    Background(){

        for(int i = 0; i < 9; i++){
            rows[i] = new CrowdRow("assets/sprites/public/" + (i + 1) + ".png", 0, height - ((i + 1) * 25));
        }
    
        scene = loadImage("assets/sprites/scene.jpg");

        crowdFeedbackImages.add(loadImage("assets/sprites/bulles/bien-ouej.png"));
        crowdFeedbackImages.add(loadImage("assets/sprites/bulles/c-ergo.png"));
        crowdFeedbackImages.add(loadImage("assets/sprites/bulles/cool.png"));
        crowdFeedbackImages.add(loadImage("assets/sprites/bulles/quel-flow.png"));
    
    }
  
    void draw(){

        theta += 0.2;
    
        image(scene, 0, 0);

        if(scoreManager.multiplier > 7) {

            float dRow = theta;
            for(int i = (this.rows.length - 1); i > 0; i--){
                this.rows[i].pos.y = this.rows[i].origin.y + sin(dRow) * 2.0;
                dRow += i;
            }
            
        } else if(scoreManager.multiplier > 3) {
            
            float dRow = theta;
            for(int i = (this.rows.length - 1); i > 0; i--){
                this.rows[i].pos.y = this.rows[i].origin.y + sin(dRow) * 1.0;
                dRow += i;
            }

        }

        

        //Draw rows
        for(int i = this.rows.length; i > 0; i--){
            this.rows[i - 1].draw();
        }

        //Draw all feedbacks
        for(int f = 0; f < this.crowdFeedbacks.size(); f++){
            CrowdFeedback fb = crowdFeedbacks.get(f);
            fb.draw();
        }

    }

    void addFeedback(){

        crowdFeedbacks.add(new CrowdFeedback(crowdFeedbackImages.get(floor(random(0, crowdFeedbackImages.size() - 1))), "oh_yeah", 3, new CrowdFeedbackCallback()));

    }

    void removeFirstFeedback(){

        this.crowdFeedbacks.remove(0);

    }
}


class CrowdRow{

    PVector origin = new PVector(0, 0);
    PVector pos = new PVector(0, 0);
    PImage src;

    CrowdRow(String srcPath, float originX, float originY){
        this.src = loadImage(srcPath);
        origin.x = pos.x = originX;
        origin.y = pos.y = originY;
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

    PImage src;
    String soundName;
    PVector pos = new PVector(0, 0);
    float dif = -30;
    float incr = 0;

    CrowdFeedback(PImage src, String soundName, float duration, Callback callback){
        super(duration, true, callback);

        this.src = src;
        this.soundName = soundName;
        this.incr = this.dif / this.duration / 60;

        // pos.x += random(-50, 50);
        // pos.y += random(-50, 50);

        soundManager.playSound(soundName);
        
    }

    void draw(){

        this.update();
        pos.y += this.incr;

        //image(src, this.pos.x, this.pos.y);

    }

}
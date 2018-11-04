class Graphism{

    PImage scene;
  
	CrowdRow[] rows = new CrowdRow[9];

    ArrayList<CrowdFeedback> crowdFeedbacks = new ArrayList<CrowdFeedback>();

    float theta = 0;
  
    Graphism(){

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
            for(int i = this.rows.length; i > 0; i--){
                this.rows[i - 1].pos.y = 0;
            }
        }

        for(int i = this.rows.length; i > 0; i--){
        this.rows[i - 1].draw();
        }
        
        // if(scoreManager.multiplier < 7){
        //   image(rang9, 0, 0);
        // }else{
        //   image(rang9, 0, sin(theta) * 10);
        // }
        
        // image(rang8, 0, 0);
        
        // if(scoreManager.multiplier < 7){
        //   image(rang7, 0, 0);
        // }else{
        //   image(rang7, 0, sin(theta) * 10);
        // }
        
        // image(rang6, 0, 0);
        
        // if(scoreManager.multiplier < 7){
        //   image(rang5, 0, 0);
        // }else{
        //   image(rang5, 0, sin(theta) * 10);
        // }
        
        // image(rang4, 0, 0);
        
        // if(scoreManager.multiplier < 7){
        //   image(rang3, 0, 0);
        // }else{
        //   image(rang3, 0, sin(theta) * 10);
        // }
        
        // image(rang2, 0, 0);
        
        // if(scoreManager.multiplier < 7){
        //   image(rang1, 0, 0);
        // }else{
        //   image(rang1, 0, sin(theta) * 10);
        // }
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
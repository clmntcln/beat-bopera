//Charge le fichier "partition" et garde les lignes en mémoire

class Parser{

    String path;
    String[] lines;

    int BPM;

    Parser(){
        
    }

    void setBPM(int val){
        BPM = val;
    }

    int getBPM(){
        return BPM;
    }

    void loadSheet(String path){

        lines = loadStrings(path);

        setBPM(parseInt(lines[0]));

    }

    void parseSheet(){

        for(int i = 0; i < lines.length; i++){
            println(lines[i]);
        }

    }

    String getLines(int index){

        return lines[index];

    }

    String getCol(String line, int index){

        String[] cols = line.split("");

        return cols[index];
    
    }

}
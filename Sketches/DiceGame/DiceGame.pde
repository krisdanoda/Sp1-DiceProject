//Die[] dice = new Die[10];
ArrayList<Die>  dice = new ArrayList<Die>();

//die1.roll();
//die2.roll();

//initialise 1 cup to 
diceCup Cup = new diceCup();

void setup() {
  size(930, 570) ;
  rectMode(CENTER) ;
}
void draw() {

}

//Class Die simulates a Die
class Die {
  color eyeColor, dieColor ;
  int eyes,x,y,size,eyeSize ;
  
  public Die(color eyeColor, color dieColor){
    this.eyeColor=eyeColor ;
    this.dieColor=dieColor ;
  }
  //Rolls the die and gives it a int value:1:6
  public int roll() {
    eyes=(int) random(1, 7) ;
    return eyes ;
  }
  //draws the die. Centering being the (x,y) coordinates
  public void draw(int x, int y, int size, int eyeSize) {
    this.x=x ;
    this.y=y ;
    this.size=size ;
    fill(dieColor) ;
    rect(x, y, size, size) ;
    // A switch case for printing different die depending on the eye 
    if (eyes==1) {
      fill(eyeColor) ;
      circle(x, y, eyeSize) ;
    } else if (eyes==2) {
      fill(eyeColor) ;
      circle(x-size/4, y-size/4, eyeSize) ;
      circle(x+size/4, y+size/4, eyeSize);
    } else if (eyes==3) {
      fill(eyeColor) ;
      circle(x-size/4, y-size/4, eyeSize) ;
      circle(x+size/4, y+size/4, eyeSize); 
      circle(x, y, eyeSize) ;
    } else if (eyes==4) {
      fill(eyeColor) ;
      circle(x-size/4, y-size/4, eyeSize) ;
      circle(x+size/4, y+size/4, eyeSize);
      circle(x-size/4, y+size/4, eyeSize) ;
      circle(x+size/4, y-size/4, eyeSize);
    } else if (eyes==5) {
      fill(eyeColor) ;
      circle(x-size/4, y-size/4, eyeSize) ;
      circle(x+size/4, y+size/4, eyeSize);
      circle(x-size/4, y+size/4, eyeSize) ;
      circle(x+size/4, y-size/4, eyeSize);
      circle(x, y, eyeSize) ;
    } else if (eyes==6) {
      fill(eyeColor) ;
      circle(x-size/4, y-size/4, eyeSize) ;
      circle(x+size/4, y+size/4, eyeSize);
      circle(x-size/4, y+size/4, eyeSize) ;
      circle(x+size/4, y-size/4, eyeSize);
      circle(x+size/4, y, eyeSize);
      circle(x-size/4, y, eyeSize);
    }
  }
}
class diceCup { 
  int size;
  ArrayList<Die> dice; //stores all dice objects in a object array
  ArrayList<Die> die1;
  ArrayList<Die> die2;
  ArrayList<Die> die3;
  ArrayList<Die> die4;
  ArrayList<Die> die5;
  ArrayList<Die> die6;
  //Contructor for diceCup Class
  public diceCup() {
     dice = new ArrayList<Die>();
     dice.clear();
  }
  //Add a Die to our dice list 
  void addDie(Die die) {
   dice.add(die);
  }
//For debugging code
  //Shakes cup, is called in mousepress. Gives all the dice in the cup a new value
  void shake() {
    for(Die die : dice){
      die.roll();
    }
  }
//Draws all the dice in the cup. The coordinates are the center of the first die
  void draw(int x, int y, int dieSize) {
    background(255);
    this.size=dieSize;
    for (int i = 0; i < dice.size(); i++) {
      dice.get(i).draw(x+i*size*3/2, y, size, size/5);
    }
  }
}

//void sortDie(diceCup temp_cup) {
// diceCup cup=temp_cup;
//   for (int k =1; k<=6; k++) {
//     Die[] sortedArray= new Die[10];
//     int count =0;
//     for (int j=0; j<dice.length; j++) {
//       if (cup[j].eyes==k) {
//         sortedArray[count] = dice[j];
//         count++;
//       }
//     }
//     cup.draw(100,100*count,100);
//   }
// }
//when the a key is pressed
void keyPressed() {
  if (key=='a') {
    Die die = new Die(255, 0);
    Cup.addDie(die);
  } else if (key == 's') {
    Cup.shake();
    Cup.draw(100, 100, 100);
  } else if (key == 'r') {
  Cup = new diceCup();
  Cup.draw(100,100,100);
  }
}
void mousePressed() {
  Cup.shake();
  Cup.draw(100, 100, 100);
}

Die[] dice = new Die[10];
Die die1 = new Die(#FF2424, 0);
Die die2 = new Die(0, 255);
Die die3 = new Die(0, #FF2424);
Die die4 = new Die(0, 255);
//die1.roll();
//die2.roll();

//initialise 1 cup to 
diceCup Cup1 = new diceCup();

void setup() {
  size(930, 570) ;
  rectMode(CENTER) ;
  Cup1.iniCup();


  //Cup1.addDie(die1);
  //Cup1.addDie(die2);
  //Cup1.addDie(die3);
  //Cup1.addDie(die4);
  //Cup1.shake();
  //Cup1.printDice();
  Cup1.draw(100, 100, 100);
}
void draw() {
}

//Class Die simulates a Die
class Die {

  color eyeColor ;
  color dieColor ;
  int eyes ;
  //
  int x ;
  int y ;
  int size ;
  int eyeSize ;
  public Die(color eyeColor, color dieColor) {
    this.eyeColor=eyeColor ;
    this.dieColor=dieColor ;
  }
  //Rolls the die and gives it a int value:1:6
  public int roll() {
    eyes=(int) random(1, 7) ;
    return eyes ;
  }
  //draws the die. Centering being the (x,y) coordinates
  public void draw(int x, int y, int size, int 
    eyeSize) {
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
  int diceNumber, size;
  Die[] diceIndex; //stores all dice objects in a object array



  //Contructor for diceCup Class
  public void iniCup() {
    diceIndex =new Die[10];
    diceNumber=0;
  }
  //Add a Die to our dice list 
  void addDie(Die die) {
    diceIndex[diceNumber]=die;
    diceNumber++;
  }

//For debugging code
  void printDice() {
    for (int i =0; diceNumber>i; i++) {
      println(diceIndex[i].eyes);
    }
  }
  //Shakes cup, is called in mousepress. Gives all the dice in the cup a new value
  void shake() {
    for (int i =0; i<diceNumber; i++) {
      diceIndex[i].roll();
    }
  }

//Draws all the dice in the cup. The coordinates are the center of the first die
  void draw(int x, int y, int dieSize) {
    this.size=dieSize;
    for (int i=0; i<diceNumber; i++) {
      diceIndex[i].draw(x+i*size*3/2, y, size, size/5);
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
    Cup1.addDie(die);
  } else if (key == 's') {
    Cup1.shake();
    Cup1.draw(100, 100, 100);
  } else if (key == 'r') {
  Cup1.iniCup();
  }
}
void mousePressed() {
  Cup1.shake();
  Cup1.draw(100, 100, 100);
}

Die[] dice = new Die[10];
Die die1 = new Die(#FF2424, 0);
  Die die2 = new Die(0, 255);
  Die die3 = new Die(0, #FF2424);
  Die die4 = new Die(0, 255);
  //die1.roll();
  //die2.roll();

  diceCup Cup1 = new diceCup();
void setup() {
  size(930, 570) ;
  rectMode(CENTER) ;



  
  Cup1.iniCup();


  //Cup1.addDie(die1);
  //Cup1.addDie(die2);
  //Cup1.addDie(die3);
  //Cup1.addDie(die4);
  Cup1.shake();
  Cup1.printDice();
  Cup1.draw(100,100,100);
}
void draw() {
}

class Die {
  color eyeColor ;
  color dieColor ;
  int eyes ;
  int x ;
  int y ;
  int size ;
  int eyeSize ;
  public Die(color eyeColor, color dieColor) {
    this.eyeColor=eyeColor ;
    this.dieColor=dieColor ;
  }
  public int roll() {
    eyes=(int) random(1, 7) ;
    return eyes ;
  }
  public void draw(int x, int y, int size, int 
    eyeSize) {
    this.x=x ;
    this.y=y ;
    this.size=size ;
    fill(dieColor) ;
    println(eyes) ;
    rect(x, y, size, size) ;
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

//void keyPressed() {
//  if (key==ENTER) {

//    }
//    Die die1=new Die(0, 255) ;
//     die1.roll() ;
//     die1.draw(100, 100, 100,20) ;

//     }


class diceCup {
  Die die;
  int diceNumber;
  Die[] diceIndex;
  int size;
  

  public void iniCup() {
    diceIndex =new Die[10];
    diceNumber=0;
  }

  void addDie(Die die) {

    diceIndex[diceNumber]=die;
    diceNumber++;
  }

  void printDice() {
    for (int i =0; diceNumber>i; i++) {
      println(diceIndex[i].eyes);
    }
  }
  void shake() {

    for (int i =0; i<diceNumber; i++) {
      diceIndex[i].roll();
    }
  }

  void draw(int x, int y, int dieSize) {
    this.size=dieSize;
    for (int i=0; i<diceNumber;i++) {
      diceIndex[i].draw(x+i*size*3/2,y, size, size/5);
    }
  }
}

void keyPressed(){
  if(key=='a'){
  Die die = new Die(255,0);
  Cup1.addDie(die);}
}
void mousePressed(){
  Cup1.shake();
  Cup1.draw(100,100,100);
}

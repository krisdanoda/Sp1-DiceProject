
ArrayList<Die>  dice = new ArrayList<Die>();

//initialise 1 cup to 
diceCup Cup = new diceCup();

void setup() {
  size(1000, 700) ;
  rectMode(CENTER) ;
}
void draw() {
}

//Class Die simulates a Die
class Die {
  color eyeColor, dieColor ;
  int eyes, x, y, size, eyeSize ;

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
  int  dieSize, x, y, k, c;
  ArrayList<Die> dice; //stores all dice objects in a object array
  ArrayList<Die> dice1;
  ArrayList<Die> dice2;
  ArrayList<Die> dice3;
  ArrayList<Die> dice4;
  ArrayList<Die> dice5;
  ArrayList<Die> dice6;
  ArrayList<Die> bucket = new ArrayList<Die>();
  //Contructor for diceCup Class
  public diceCup() {
    dice = new ArrayList<Die>();
    dice.clear();
  }
  //Add a Die to our dice list 
  void addDie(Die die) {
    dice.add(die);
  }

  //Shakes cup, is called in mousepress. Gives all the dice in the cup a new value
  void shake() {
    dice1=new ArrayList<Die>();
    dice2=new ArrayList<Die>();
    dice3=new ArrayList<Die>();
    dice4=new ArrayList<Die>();
    dice5=new ArrayList<Die>();
    dice6=new ArrayList<Die>();

    for (Die die : dice) {
      die.roll();
    }
  }
  //Draws all the dice in the cup. The coordinates are the center of the first die
  void draw(int x, int y, int dieSize) {
    k=0;
    background(255);
    this.dieSize=dieSize;
    this.x = x;
    this.y = y;
    //for (int i = 0; i < dice.size(); i++) {
    //  dice.get(i).draw(x+i*dieSize*3/2, y, dieSize, dieSize/5);
    //}

    for (Die die : dice) {
      if (die.eyes==1) {
        dice1.add(die);
      } else if (die.eyes==2) {
        dice2.add(die);
      } else if (die.eyes==3) {
        dice3.add(die);
      } else if (die.eyes==4) {
        dice4.add(die);
      } else if (die.eyes==5) {
        dice5.add(die);
      } else if (die.eyes==6) {
        dice6.add(die);
      }
    }

    if (dice1.size()>0) {
      c=0;
      for (Die die : dice1) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    }
    if (dice2.size()>0) {
      c=0;
      for (Die die : dice2) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    } 
    if (dice3.size()>0) {
      c=0;
      for (Die die : dice3) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    } 
    if (dice4.size()>0) {
      c=0;
      for (Die die : dice4) {
        die.draw(x+c*dieSize*3/2, y+ dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    } 
    if (dice5.size()>0) {
      c=0;
      for (Die die : dice5) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    }  
    if (dice6.size()>0) {
      c=0;
      for (Die die : dice6) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;
      }
      k++;
    }
  }
}

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
    Cup.draw(100, 100, 100);
  }
}
void mousePressed() {
  Cup.shake();
  Cup.draw(100, 100, 100);
}

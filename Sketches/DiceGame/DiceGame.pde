
ArrayList<Die>  dice = new ArrayList<Die>();
int size=50;
color bg;


//initialise 1 cup to 
diceCup Cup = new diceCup();

void setup() {
  size(1000, 700) ;
  rectMode(CENTER) ;
 background(255);
bg = color(20,180,40);
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
  int  dieSize, x, y, k, c, maxDice;
  ArrayList<Die> dice; //stores all dice objects in a object array
  ArrayList<Die> dice1; //buckets
  ArrayList<Die> dice2;
  ArrayList<Die> dice3;
  ArrayList<Die> dice4;
  ArrayList<Die> dice5;
  ArrayList<Die> dice6;

  //Contructor for diceCup Class
  public diceCup() {
    dice = new ArrayList<Die>();
    dice.clear();
  }
  //Add a Die to our dice list 
  void addDie(Die die) {
    dice.add(die);
  }
 //Remove a Die to our dice list 
  void removeDie() {
    if(dice.size()>0)
    dice.remove(dice.size()-1);
  }
  //Shakes cup, is called in mousepress. Gives all the dice in the cup a new value
  void shake() {
    for (Die die : dice) {
      die.roll();
    }
  }
  //Draws all the dice in the cup. The coordinates are the center of the first die
  void draw(int x, int y, int dieSize) {
    k=0;
    this.dieSize=dieSize;
    this.x = x;
    this.y = y;

//buckets
    dice1=new ArrayList<Die>();
    dice2=new ArrayList<Die>();
    dice3=new ArrayList<Die>();
    dice4=new ArrayList<Die>();
    dice5=new ArrayList<Die>();
    dice6=new ArrayList<Die>();

    maxDice= 0; //describes the largest number of die in a row.
    for (Die die : dice) {
      if (die.eyes==1) {
        dice1.add(die);
        if (maxDice<dice1.size())
          maxDice = dice1.size();
      } else if (die.eyes==2) {
        dice2.add(die);
        if (maxDice<dice2.size())
          maxDice = dice2.size();
      } else if (die.eyes==3) {
        dice3.add(die);
        if (maxDice<dice3.size())
          maxDice = dice3.size();
      } else if (die.eyes==4) {
        dice4.add(die);
        if (maxDice<dice4.size())
          maxDice = dice4.size();
      } else if (die.eyes==5) {
        dice5.add(die);
        if (maxDice<dice5.size())
          maxDice = dice5.size();
      } else if (die.eyes==6) {
        dice6.add(die);
        if (maxDice<dice6.size())
          maxDice = dice6.size();
      }
    }
  dieSize = (int)(width/(1.5*maxDice+.5));
  if(dieSize > size) dieSize = size;
    x = dieSize;
    y = dieSize;
  
  //draw all of our dice
    if (dice1.size()>0) {
      c=0;
      for (Die die : dice1) {
        die.draw(x+c*dieSize*3/2, y+dieSize*k*3/2, dieSize, dieSize/5);
        c++;//varies the placement in the x axis we draw 
      }
      k++; //Comtrols which row to draw in. if a row is empty dont draw in it
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
  void drawText() {// draws the no of dice as text
    fill(0);
    textSize(128);
    text("No. dice: " +dice.size(), 50, height-50);
  }
}

//when the a key is pressed
void keyPressed() {
  if (key=='a') {
    //adds a die when you press a
    background(bg);
    Die die = new Die(color(random(255), random(255), random(255)), color(random(255), random(255), random(255)));
    Cup.addDie(die);
    Cup.drawText();
    Cup.draw(size, size, size);
  }  if (key == 's') {
    //Shakes the cup and draws the dice
    background(bg);
    Cup.shake();   
    Cup.draw(size, size, size);
    Cup.drawText();
  }  if (key == 'r') {
    //Empties the cup
    Cup = new diceCup();
    Cup.draw(size, size, size);
   background(bg); 
   Cup.drawText();
  }  if(key == BACKSPACE){
    //removes a die
  background(bg);
  Cup.removeDie();
  Cup.drawText();
  Cup.draw(size, size, size);}
}

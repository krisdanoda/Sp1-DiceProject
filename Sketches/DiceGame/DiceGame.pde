
ArrayList<Die>  dice = new ArrayList<Die>();

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
  int size;
  ArrayList<Die> dice; //stores all dice objects in a object array
  ArrayList<Die> dice1;
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

  //Shakes cup, is called in mousepress. Gives all the dice in the cup a new value
  void shake() {
    for (Die die : dice) {
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
    
      
      

      //switch (part.eyes) {
      //case '1':
      //  dice1.add(dice.get(i));
      //  print(1);
      //  break ;
      //case '2':
      //  dice2.add(dice.get(i));print(2);
      //  break ;
      //case '3':
      //  dice3.add(dice.get(i));print(3);
      //  break ;
      //case '4':
      //  dice4.add(dice.get(i));print(4);
      //  break ;
      //case '5':
      //  dice5.add(dice.get(i));print(5);
      //  break ;
      //case '6':
      //  dice6.add(dice.get(i));print(6);
      //  break ;
      //}

      if ( dice1.get(i).eyes==1) {
        dice1.add(dice.get(i));
        print(1);
      } else if ( part.eyes==2) {
        dice2.add(dice.get(i));
        print(1);
      } else if ( part.eyes==3) {
        dice3.add(dice.get(i));
        print(1);
      } else if ( part.eyes==4) {
        dice4.add(dice.get(i));
        print(1);
      } else if ( part.eyes==5) {
        dice5.add(dice.get(i));
        print(1);
      } else if ( part.eyes==6) {
        dice6.add(dice.get(i));
        print(1);
      }

      for (int k = 0; k < dice1.size(); k++) {
        dice1.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
      for (int k = 0; k < dice2.size(); k++) {
        dice2.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
      for (int k = 0; k < dice3.size(); k++) {
        dice3.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
      for (int k = 0; k < dice4.size(); k++) {
        dice4.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
      for (int k = 0; k < dice5.size(); k++) {
        dice5.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
      for (int k = 0; k < dice6.size(); k++) {
        dice6.get(k).draw(x+k*size*3/2, size*y, size, size/5);
      }
      y++;
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

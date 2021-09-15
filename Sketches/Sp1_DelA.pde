void setup() {
  size(600, 600) ;
  rectMode(CENTER) ;
  println("Press enter to roll") ;
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
  int eyeSize= 20 ;
  public Die(color eyeColor, color dieColor) {
    this.eyeColor=eyeColor ;
    this.dieColor=dieColor ;
  }
  public int roll() {
    eyes=(int) random(1, 7) ;
    return eyes ;
  }
  public void draw(int x, int y, int size) {
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
void keyPressed() {
  if (key==ENTER) {
    Die die1=new Die(0, 255) ;
    die1.roll() ;
    die1.draw(100, 100, 100) ;
  }
}

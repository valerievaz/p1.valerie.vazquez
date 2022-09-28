int bNumber = 12;
PFont braille;
PFont font;
RectButton [] buttons = new RectButton[bNumber];
color[] colors = {215,#00FF00};
boolean locked = false;

void setup(){
  size(355,505);
  background(255);
  stroke(1);
  font = createFont("Helvetica", 24, true);
 // braille = createFont("Swell-Braille.ttf", 24, true);
  for(int i=0; i<bNumber; i++){
    buttons[i] = new RectButton( "t",80,50+i*70,45,35,colors[0],colors[1]);
        buttons[i].regColor = colors[0];

  }
  buttons[0].setName("3");
  buttons[1].setName("2");
  buttons[2].setName("1");
  buttons[3].setName("*G");
  buttons[4] =  new RectButton("t", 80,230+2*90,55,35,colors[0],colors[1]);
  buttons[4].setName("ALARM");
   buttons[5] =  new RectButton( "t",180,230+2*90,55,35,colors[0],colors[1]);
  buttons[5].setName("CALL");
   buttons[6] =  new RectButton("t", 190, 44+2*3,45,35,colors[0],colors[1]);
  buttons[6].setName("4");
   buttons[7] =  new RectButton("t", 190, 115+2*3,45,35,colors[0],colors[1]);
  buttons[7].setName("5");
 buttons[8] =  new RectButton("t", 190, 185+2*3,45,35,colors[0],colors[1]);
  buttons[8].setName("6");
  buttons[9] =  new RectButton("t", 190, 255+2*3,45,35,colors[0],colors[1]);
 buttons[9].setName("7");
 
  buttons[10] =  new RectButton("t", 190, 210+2*60,70,35,colors[0],colors[1]);
 buttons[10].setName("Close Door");
 
   buttons[11] =  new RectButton("t", 55, 210+2*60,70,35,colors[0],colors[1]);
 buttons[11].setName("Open Door");
}

void draw(){
  textSize(14);
  background(105);
  fill(255);
  text("Floor One", 40, 210);
  text("Floor Two", 40, 140);
  text("Floor Three", 40, 70);
  text("Ground Floor", 40, 280);
  text("Floor Four", 273, 70);
  text("Floor Five", 273, 142);
  text("Floor Six", 273, 210);
  text("Floor Seven", 273, 280);

  update(mouseX, mouseY);
  for(int i=0; i<bNumber; i++){
    buttons[i].display();
  }
}

void update(int x, int y){
  if(locked == false) {
    for(int i=0; i<bNumber; i++){
       buttons[i].update();
    }
  }
  else {
    locked = false;
  }

 if (mousePressed ) {
   fill(0);
    for(int i=0; i<12; i++){
                       //  textSize(20);

      if(buttons[i].pressed()) {
        if (buttons[i] == buttons[4]){
          text("ALARM HAS BEEN RUNG!!!", 150,30); }
        
        else if (buttons[i] == buttons[5]){
         // textSize(20);
          text("CALLING FOR HELP!!!", 150,30);}
          
        else if (buttons[i] == buttons[10]){
                  //  textSize(20);

          text("Door is closing...", 150,30);}
        
          else if (buttons[i] == buttons[11]){
                  //    textSize(20);

          text("Door is opening...", 150,30);}

       else {
                    //        textSize(13.3);

         text("You are going to floor " + buttons[i].name, 150,30);
                      // textSize(20);

        buttons[i].regColor = colors[1];
       }
     
      } 

    }
 }
 
}


class Button
{
  String name;
  int posX, posY;
  int sizeX;
  int sizeY;
  color buttonColor,regColor,highlightColor;
  boolean over = false;
  boolean pressed = true;
  boolean toggle = false;
 
 void setName(String name){this.name = name;}

 void update()
  {
    if(over()) { 
      buttonColor = highlightColor;

    }
    else {
      buttonColor = regColor;
    }
  }

  boolean pressed()
  {
    if(over) {
     locked = true;

     regColor = highlightColor;
      return true;
    }
    else {
      locked = false;
      return false;
    }
  }
  boolean over()
  {
    return true;
  }
}

class RectButton extends Button
{
  RectButton(String name,int posX, int posY, int sizeX, int sizeY, color regColor, color highlightColor)
  {
    this.name = name;
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.regColor = regColor;
    this.highlightColor = highlightColor;
    this.buttonColor = regColor;
  }
  boolean overRect(int x, int y, int width, int height)
  {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
    }
    else {
      return false;
    }
  }
  boolean over()
  {
    if( overRect(posX, posY, sizeX, sizeY) ) {
      over = true;
     // text("This floor has been picked" , 80, 90);

      return true;
    }
    else {
      over = false;
      return false;
    }
  }

  void display()
  {
    stroke(0);
    fill(buttonColor);
    rect(posX, posY, sizeX, sizeY);
    fill(0);
    textAlign(CENTER);
    text(name,posX+sizeX/2,posY+sizeY/2+5);
  }
}
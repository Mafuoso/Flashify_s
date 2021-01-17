int screen = 0; 
String [] data = new String[20];
String lastQuestion;
String lastAns;
String BB = "";
String CC = " ";
PImage logo;

void setup() {

  size(800, 500);

  background (0);

  screen = 0;

  logo = loadImage("unknown.png");

  load();

  load2();
}

void draw() {  

  if (screen == 0 ) {

    load();

    load2();

    BB = " ";

    CC = " ";

    background(42, 45, 47);

    image(logo, 500, 90, 250, 250);

    fill(255);

    textSize(50);

    text("Flashify", 300, 70);

    textSize (20);

    text("How it works\n 1. Add a question and answer set to deck\n 2. Play and test Your memorization skills\n 3. Play again to continue studying", 20, 125);

    fill(94, 95, 93);

    stroke(255, 131, 0);

    strokeWeight(3);

    rect(40, 400, 150, 80, 20);

    // rect(340, 400, 150, 80, 20);

    rect(630, 400, 150, 80, 20);

    fill(255);

    text ("New Deck", 70, 445);

    //text ("Add to Deck", 350, 445);

    text ("Play", 675, 445);
  }

  if (screen == 1) {

    background(42, 45, 47);

    textSize(30);

    fill(255);

    text("Type your Question and Answer", 170, 50);

    text( "Q: ", 60, 130); 

    fill(94, 95, 93);

    rect (100, 100, 670, 90, 10);

    textSize(15);

    fill (255);

    text( BB + " | ", 110, 130); 

    fill(255);

    textSize(30);

    text( "Ans: ", 30, 230); 

    fill(94, 95, 93);

    rect (100, 200, 670, 90, 10);

    textSize(15);

    fill (255);

    //text( CC + " | ", 110, 230);

    fill(94, 95, 93);

    stroke(255, 131, 0);

    strokeWeight(3);

    rect(50, 350, 200, 100, 20);

    rect(300, 350, 200, 100, 20);

    rect(550, 350, 200, 100, 20);

    fill(255);

    textSize(30);

    text("Save", 120, 400);

    text("Menu", 360, 400);

    text("Play", 630, 400);
  }

  if (screen == 2) {
    
    load();
    
    load2();

    background(42, 45, 47);

    textSize(30);

    fill(255);

    text("Type your Question and Answer", 170, 50);

    text( "Q: ", 60, 130); 

    fill(94, 95, 93);

    rect (100, 100, 670, 90, 10);

    textSize(15);

    fill (255);

    text( BB + " | ", 110, 130); 

    fill(255);

    textSize(30);

    text( "Ans: ", 30, 230); 

    fill(94, 95, 93);

    rect (100, 200, 670, 90, 10);

    textSize(15);

    fill (255);

    text( CC + " | ", 110, 230);

    fill(94, 95, 93);

    stroke(255, 131, 0);

    strokeWeight(3);

    rect(50, 350, 200, 100, 20);

    rect(300, 350, 200, 100, 20);

    rect(550, 350, 200, 100, 20);

    fill(255);

    textSize(30);

    text("Save", 120, 400);

    text("Menu", 360, 400);

    text("Play", 630, 400);
  }

  if (screen == 3) {

    background(42, 45, 47);

    fill(94, 95, 93);

    rect(50, 50, 700, 200, 20);

    rect(50, 270, 150, 70, 20);

    rect(600, 270, 150, 70, 20);

    /*rect(150, 370, 60, 60, 20);

    rect(250, 370, 60, 60, 20);

    rect(350, 370, 60, 60, 20);

    rect(450, 370, 60, 60, 20);

    rect(550, 370, 60, 60, 20);

    rect(650, 370, 60, 60, 20);*/

    fill(255);

    textSize(20);

    text("Show ans", 80, 310);

    text("Back", 650, 310);

    /*text("0", 175, 410);

    text("1", 275, 410);

    text("2", 375, 410);

    text("3", 475, 410);

    text("4", 575, 410);

    text("5", 675, 410);*/

    textSize(20);

    text(lastQuestion, 70, 90);
  }
  if (screen == 4) {

    background(42, 45, 47);

    fill(94, 95, 93);

    rect(50, 50, 700, 200, 20);

    rect(50, 270, 150, 70, 20);

    rect(600, 270, 150, 70, 20);

    /*rect(150, 370, 60, 60, 20);

    rect(250, 370, 60, 60, 20);

    rect(350, 370, 60, 60, 20);

    rect(450, 370, 60, 60, 20);

    rect(550, 370, 60, 60, 20);

    rect(650, 370, 60, 60, 20);*/

    fill(255);

    textSize(20);

    text("Show ans", 80, 310);

    text("Back", 650, 310);

    /*text("0", 175, 410);

    text("1", 275, 410);

    text("2", 375, 410);

    text("3", 475, 410);

    text("4", 575, 410);

    text("5", 675, 410);*/

    textSize(20);

    text(lastQuestion, 70,90);

    text(lastAns, 70, 190);
  }
}

void mousePressed() {

  if (screen == 0) {

    if (mouseX > 40 && mouseX < 190 && mouseY > 400 && mouseY < 480) {

      screen = 1;
    } /*else  if (mouseX > 340 && mouseX < 490 && mouseY > 400 && mouseY < 480) {
     
     screen = 4;
     } */
    else  if (mouseX > 630 && mouseX < 780 && mouseY > 400 && mouseY < 480) {

      screen = 3;
    }
  }

  if (screen == 2) {

    if (mouseX > 50 && mouseX < 250 && mouseY> 350 && mouseY < 450) {

      save();

      save2();

      println("save");
    } else  if (mouseX > 300 && mouseX < 500 && mouseY> 350 && mouseY < 450) {

      screen = 0;
      println("save");
    } else  if (mouseX > 550 && mouseX < 750 && mouseY> 350 && mouseY < 450) {

      screen = 3;
      println("save");
    }
  }

  if (screen == 3) {

    if (mouseX > 50 && mouseX < 300 && mouseY > 270 && mouseY < 340) {//Show ans button

      screen = 4;
    }
    if (mouseX > 650 && mouseX < 700 && mouseY > 270 && mouseY < 340) {
      screen= 0;
    }
    /*if (mouseX > 150 && mouseX < 210 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 250 && mouseX < 310 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 350 && mouseX < 410 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 450 && mouseX < 510 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 550 && mouseX < 610 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 650 && mouseX < 710 && mouseY > 370 && mouseY < 430) {
    }*/
  }
  
  if (screen == 4) {

    /*if (mouseX > 50 && mouseX < 300 && mouseY > 270 && mouseY < 340) {//Show ans button

      screen = 4;
    }*/
    if (mouseX > 650 && mouseX < 700 && mouseY > 270 && mouseY < 340) {
      screen= 0;
    }
    /*if (mouseX > 150 && mouseX < 210 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 250 && mouseX < 310 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 350 && mouseX < 410 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 450 && mouseX < 510 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 550 && mouseX < 610 && mouseY > 370 && mouseY < 430) {
    }
    if (mouseX > 650 && mouseX < 710 && mouseY > 370 && mouseY < 430) {
    }*/
  }

  if (screen == 1) {

    if (mouseX > 100 && mouseX < 770 && mouseY> 200 && mouseY < 290) {

      screen = 2;
    } else  if (mouseX > 300 && mouseX < 500 && mouseY> 350 && mouseY < 450) {

      screen = 0;
      println("save");
    }
  }
}

void keyPressed () {

  if (screen == 1) {
    if (keyCode == BACKSPACE && BB.length () > 0) {

      BB = BB.substring(0, BB.length()-1);
    } else {

      if (key >= int ('A') && key <= int('z')) {

        BB = BB + key;
      } else if (key == ' ' ) {

        BB = BB + ' ';
      } else if (key == ENTER) {

        BB = BB + "\n" ;
      }
    }
  }

  if (screen == 2) {

    if (keyCode == BACKSPACE && CC.length () > 0) {

      CC = CC.substring(0, CC.length()-1);
    } else {

      if (key >= int ('A') && key <= int('z')) {

        CC = CC + key;
      } else if (key == ' ' ) {

        CC = CC + ' ';
      } else if (key == ENTER) {

        CC = CC + "\n" ;
      }
    }
  }
}

void save() {
  data[0] = BB;
  // data[1] = CC;
  //data[1]= CC;
  saveStrings("AppData.txt", data);
}

void save2() {
  data[1] = CC;
  //data[1]= wins + "";
  saveStrings("AppData2.txt", data);
}

void load() {
  data = loadStrings("AppData.txt");
  lastQuestion = data[0];
  //lastAnswer = data[1];
  //lastwins = Integer.parseInt(data[1]);
}

void load2() {
  data = loadStrings("AppData2.txt");
  lastAns = data[1];
  //lastAnswer = data[1];
  //lastwins = Integer.parseInt(data[1]);
}

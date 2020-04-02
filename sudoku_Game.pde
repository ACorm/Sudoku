int [] [] sudokuNumbers = new int [9] [9];
int [] [] sudokuGame = new int [9] [9];
int [] [] startingNumbers = new int [9] [9];
int [] [] highlightedSquare = new int [9] [9];
int highlightColor = color(200, 0, 0);
int squareDire = 0;
int LOffset=0;
int DOffset=0;
boolean win = false;

void setup() {
  background(0);
  fullScreen();
  squareDire=min(width, height)-200;
  LOffset = (width-squareDire)/2;
  DOffset = (height-squareDire)/2;
  sudokuNumbers=growSudoku();
  //startingNumbers=sudokuNumbers;
  startingNumbers [3] [3] = 6;
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuGame [row] [column] = startingNumbers [row] [column];
    }
  }
  rectMode(CENTER);
  textSize(30);
  textAlign(CENTER, CENTER);
  stroke(255);
}

void draw() {
  if (win) {
    background(0);
  } else {
    background(200);
  }
  for (int x=0; x<9; x++) {
    for (int y=0; y<9; y++) {
      pushMatrix();
      translate(squareDire/9.0*(x+0.5)+LOffset, squareDire-squareDire/9.0*(y+0.5)+DOffset);
      if (highlightedSquare [x] [y]==1) {
        fill(highlightColor);
      } else {
        fill(0);
      }
      rect(0, 0, squareDire/9.0, squareDire/9.0);
      if (sudokuGame [x] [y] !=0) {
        if (startingNumbers [x] [y]!=0) {
          fill(255);
        } else {
          fill(155);
        }
        text(sudokuGame [x] [y], 0, 0);
      }
      popMatrix();
    }
  }
}

void mouseDragged() {
  int column=floor((mouseX-LOffset)*9.0/squareDire);
  int row=8-floor((mouseY-DOffset)*9.0/squareDire);
  if ((row+1)>0 && (row+1)<10 && (column+1)>0 && (column+1)<10) {
    highlightedSquare [column] [row]=1;
  }
}

void mousePressed() {
  if (!(keyPressed && keyCode == SHIFT )) {
    highlightedSquare = new int [9] [9];
  }
  int column=floor((mouseX-LOffset)*9.0/squareDire);
  int row=8-floor((mouseY-DOffset)*9.0/squareDire);
  if ((row+1)>0 && (row+1)<10 && (column+1)>0 && (column+1)<10) {
    highlightedSquare [column] [row]=1;
  }
}

void keyPressed() {
  int number = -1;
  int Key = key;
  if (48<Key && Key<58) {
    Key=-1;
  }
  switch(Key) {
    case(8):
    //Backspace
    number=0;
    break;
    case(10):
    //Enter
    boolean W = true;
    for (int row =0; row<9; row++) {
      for (int column =0; column<9; column++) {
        if (sudokuGame [column] [row]!=sudokuNumbers [column] [row]) {
          W = false;
          break;
        }
      }
      if (!W) {
        break;
      }
    }
    win=W;
    break;
    case(-1):
    number=key-48;
    break;
  }
  if (number!=-1) {
    for (int row =0; row<9; row++) {
      for (int column =0; column<9; column++) {
        if (highlightedSquare [column] [row]==1 && startingNumbers [column] [row]==0) {
          sudokuGame [column] [row]=number;
        }
      }
    }
  }
}

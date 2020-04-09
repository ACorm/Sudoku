int [] [] sudokuNumbers = new int [9] [9];
int highlightColor = color(200, 0, 0);
int squareDire = 0;
int LOffset=0;
int DOffset=0;
boolean win = false;
boolean custom=false;
int drawState;

cell [] [] sudokuCells;
void setup() {
  drawState=0;
  background(0);
  //size(600, 600); 
  fullScreen();
  rectMode(CENTER);
  textSize(30);
  textAlign(CENTER, CENTER);
  squareDire=min(width, height)-200;
  LOffset = (width-squareDire)/2;
  DOffset = (height-squareDire)/2;
}

void settingUp() {
   sudokuCells = new cell [9] [9];
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [column] [row] = new cell(column, row);
    }
  } 
  if (!custom) {
    growSudoku();
  } else {
    for (int row=0; row<9; row++) {
      for (int column=0; column<9; column++) {
        sudokuCells [row] [8-column].value = sudokuNumbers [column] [row];
        if (sudokuNumbers [column] [row]!=0) {
          sudokuCells [row] [8-column].starter=true;
        }
      }
    }
    solveSudoku(false,true);
    for (int row=0; row<9; row++) {
      for (int column=0; column<9; column++) {
        sudokuCells [row] [8-column].doneGrowing();
        if (!sudokuCells [row] [8-column].starter) {
          sudokuCells [row] [8-column].value=0;
        }
      }
    }
  }
  stroke(255);
  drawState=2;
}

void draw() {
  switch(drawState) {
    case(0):
    DrawSelection();
    break;
    case(1):
    settingUp();
    break;
    case(2):
    DrawBoard();
    if (win) {
      drawState=3;
      win=false;
    }
    break;
    case(3):
    Win();
    break;
  }
}

void DrawBoard() {
  background(0);
  for (int column=0; column<9; column++) {
    for (int row=0; row<9; row++) {
      sudokuCells [column] [row].DrawCell();
    }
  }
  noFill();
  for (int squareX=0; squareX<3; squareX++) {
    for (int squareY=0; squareY<3; squareY++) {
      pushMatrix();
      translate(squareDire/9.0*((3*squareX+1)+0.5)+LOffset, squareDire-squareDire/9.0*((3*squareY+1)+0.5)+DOffset);
      stroke(255);
      rect(0, 0, 3*squareDire/9.0, 3*squareDire/9.0);
      popMatrix();
    }
  }
}

void mouseDragged() {
  if (drawState==2) {
    int column=floor((mouseX-LOffset)*9.0/squareDire);
    int row=8-floor((mouseY-DOffset)*9.0/squareDire);
    if ((row+1)>0 && (row+1)<10 && (column+1)>0 && (column+1)<10) {
      sudokuCells [column] [row].highlighted=true;
    }
  }
}

void mousePressed() {
  if (drawState==2) {
    if (!(keyPressed && keyCode == SHIFT )) {
      for (int column=0; column<9; column++) {
        for (int row=0; row<9; row++) {
          sudokuCells [column] [row].highlighted=false;
        }
      }
    }
    int column=floor((mouseX-LOffset)*9.0/squareDire);
    int row=8-floor((mouseY-DOffset)*9.0/squareDire);
    if ((row+1)>0 && (row+1)<10 && (column+1)>0 && (column+1)<10) {
      sudokuCells [column] [row].highlighted=true;
    }
  }
}

void keyReleased() {
  if (drawState==2) {
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
          if (sudokuCells [column] [row].value != sudokuCells [column] [row].endValue) {
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
      case('h'):
      //h
      //println("hint");
      solveSudoku(true,false);
      break;
      case('s'):
      //s
      //println("solved");
      //solveSudoku(false,false);
      break;
      case(-1):
      number=key-48;
      break;
    }
    if (number!=-1) {
      for (int row =0; row<9; row++) {
        for (int column =0; column<9; column++) {
          if (sudokuCells [column] [row].highlighted && sudokuCells [column] [row].starter==false) {
            sudokuCells [column] [row].value = number;
          }
        }
      }
    }
  }
}

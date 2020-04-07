int [] [] sudokuNumbers = new int [9] [9];
int [] [] sudokuGame = new int [9] [9];
int [] [] startingNumbers = new int [9] [9];
int [] [] highlightedSquare = new int [9] [9];
int highlightColor = color(200, 0, 0);
int squareDire = 0;
int LOffset=0;
int DOffset=0;
boolean win = false;


cell [] [] sudokuCells;

void setup() {
  sudokuCells = new cell [9] [9];
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [column] [row] = new cell(column,row);      
      //print(column + ",");
    }
    //print(row + ",");
  }


  background(0);
  size(600, 600);
  squareDire=min(width, height)-200;
  LOffset = (width-squareDire)/2;
  DOffset = (height-squareDire)/2;
  growSudoku();

  //startingNumbers=sudokuNumbers;

  //startingNumbers = StartingNumbers.FIRST_PUZZLE_2;
  startingNumbers=StartingNumbers.EVIL_PUZZLE;

  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [row] [column].value = startingNumbers [row] [column];
      if(startingNumbers [row] [column]!=0){
      sudokuCells [row] [column].starter=true;
      }
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
  for (int column=0; column<9; column++) {
    for (int row=0; row<9; row++) {
      sudokuCells [column] [row].DrawCell();
    }
  }
}

void mouseDragged() {
  int column=floor((mouseX-LOffset)*9.0/squareDire);
  int row=8-floor((mouseY-DOffset)*9.0/squareDire);
  if ((row+1)>0 && (row+1)<10 && (column+1)>0 && (column+1)<10) {
    sudokuCells [column] [row].highlighted=true;
  }
}

void mousePressed() {
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
    case(115):
    //s
    println("solving...");
    solveSudoku();
    break;
    case(-1):
    number=key-48;
    break;
  default:
    println(int(key));
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

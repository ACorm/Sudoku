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
  size(600, 600);
  squareDire=min(width, height)-200;
  LOffset = (width-squareDire)/2;
  DOffset = (height-squareDire)/2;
  sudokuNumbers=growSudoku();
  startingNumbers=sudokuNumbers;


  //startingNumbers [1] [0]=3;
  //startingNumbers [2] [0]=9;
  //startingNumbers [5] [0]=7;
  //startingNumbers [8] [0]=5;
  //startingNumbers [1] [1]=7;
  //startingNumbers [3] [1]=9;
  //startingNumbers [4] [1]=1;
  //startingNumbers [7] [1]=2;
  //startingNumbers [0] [2]=5;
  //startingNumbers [1] [2]=4;
  //startingNumbers [8] [2]=1;
  //startingNumbers [2] [3]=3;
  //startingNumbers [4] [3]=7;
  //startingNumbers [5] [3]=1;
  //startingNumbers [6] [3]=2;
  //startingNumbers [0] [4]=2;
  //startingNumbers [2] [4]=7;
  //startingNumbers [3] [4]=3;
  //startingNumbers [5] [4]=9;
  //startingNumbers [6] [4]=5;
  //startingNumbers [0] [5]=9;
  //startingNumbers [7] [5]=3;
  //startingNumbers [8] [6]=6;
  //startingNumbers [1] [7]=2;
  //startingNumbers [6] [7]=3;
  //startingNumbers [7] [7]=4;
  //startingNumbers [8] [7]=7;
  //startingNumbers [2] [8]=5;
  //startingNumbers [4] [8]=6;
  //startingNumbers [8] [8]=2;


  //startingNumbers=new int [] []{
  //  {6, 0, 0, 0, 7, 0, 1, 0, 0}, 
  //  {3, 0, 0, 0, 0, 9, 0, 2, 0}, 
  //  {0, 1, 7, 0, 0, 0, 0, 9, 6}, 
  //  {0, 0, 0, 0, 0, 5, 6, 0, 0}, 
  //  {4, 0, 0, 0, 0, 0, 0, 0, 2}, 
  //  {0, 0, 3, 8, 0, 0, 0, 0, 0}, 
  //  {9, 7, 0, 0, 0, 0, 8, 4, 0}, 
  //  {0, 4, 0, 7, 0, 0, 0, 0, 5}, 
  //  {0, 0, 6, 0, 2, 0, 0, 0, 9}  
  //};

  //startingNumbers [3] [3] = 6;
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
  for (int column=0; column<9; column++) {
    for (int row=0; row<9; row++) {
      pushMatrix();
      translate(squareDire/9.0*(column+0.5)+LOffset, squareDire-squareDire/9.0*(row+0.5)+DOffset);
      if (highlightedSquare [column] [row]==1) {
        fill(highlightColor);
      } else {
        fill(0);
      }
      rect(0, 0, squareDire/9.0, squareDire/9.0);
      if (sudokuGame [column] [row] !=0) {
        if (startingNumbers [column] [row]!=0) {
          fill(255);
        } else {
          fill(155);
        }
        text(sudokuGame [column] [row], 0, 0);
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
    case(115):
    //s
    println("solving...");
    sudokuGame=solveSudoku(sudokuGame);
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
        if (highlightedSquare [column] [row]==1 && startingNumbers [column] [row]==0) {
          sudokuGame [column] [row]=number;
        }
      }
    }
  }
}

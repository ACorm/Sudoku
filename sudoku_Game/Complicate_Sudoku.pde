int [] [] sudokuState;
void complicateSudoku() {
  sudokuState = new int [9] [9];
  setSudokuState();
  int totalStartingValues=81;
  int startingNumberGoal=0;
  int [] [] impossibleSquare=new int [9] [9];
  while (totalStartingValues>startingNumberGoal) {
    int randX=round(random(-0.5, 8.5));
    int randY=round(random(-0.5, 8.5));
    boolean possible=false;
    for (int row=0;row<9;row++) {
      for (int column=0;column<9;column++) {
        if(impossibleSquare [column] [row]==0){
          possible=true;
        }
      }
    }
    if(!possible){
      break;
    }    
    while (impossibleSquare [randX] [randY]==1) {
      randX=round(random(-0.5, 8.5));
      randY=round(random(-0.5, 8.5));
    }
    sudokuCells [randX] [randY].value=0;
    setSudokuState();
    if (solveSudoku(false)) {
      setCellState();
      totalStartingValues--;
      impossibleSquare=new int [9] [9];
    } else {
      setCellState();
      sudokuCells [randX] [randY].value=sudokuCells [randX] [randY].endValue;
      impossibleSquare [randX] [randY]=1;
    }
  }
  
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [column] [row].doneComplicating();
    }
  }
}

void setSudokuState() {
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuState [column] [row]=sudokuCells [column] [row].value;
    }
  }
}

void setCellState() {
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [column] [row].value=sudokuState [column] [row];
    }
  }
}

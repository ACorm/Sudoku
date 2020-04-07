int [] [] sudokuState;
void complicateSudoku() {
  sudokuState = new int [9] [9];
  setSudokuState();
  int totalStartingValues=81;
  while (totalStartingValues>50) {
    int randX=round(random(-0.5, 9.5));
    int randY=round(random(-0.5, 9.5));
    sudokuCells [randX] [randY].value=0;
    setSudokuState();
    if (solveSudoku()) {
      setCellState();
      totalStartingValues--;
    }else{
      setCellState();
      sudokuCells [randX] [randY].value=0;
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

void setCellState(){
  for (int row=0; row<9; row++) {
    for (int column=0; column<9; column++) {
      sudokuCells [column] [row].value=sudokuState [column] [row];
    }
  }  
}

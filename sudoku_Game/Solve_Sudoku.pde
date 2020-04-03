int [] [] [] impossibleNumbers;
boolean change = true;
IntList buffer;
int [] [] sudokuState;
int [] [] solveSudoku(int [] [] transfer) {
  change=true;
  impossibleNumbers=new int [9] [9] [9];
  sudokuState=transfer;
  while (change) {
    change = false;
    for (int row=0; row<9; row++) {
      for (int column=0; column<9; column++) {
        if (sudokuState [column] [row]==0) {
          buffer=checkDigits(column, row, sudokuState);
          if (buffer.size()==8) {
            for (int value=0; value<9; value++) {
              if (!buffer.hasValue(value+1)) {
                change=true;
                sudokuState [column] [row] = value+1;
              }
            }
          } else {
            for (int value=0; value<9; value++) {
              if (buffer.hasValue(value+1)) {
                impossibleNumbers [column] [row] [value] = 1;
              }
            }
            if (buffer.size()==9) {
              println("while trying to solve the sudoku the program realised it is impossible");
            }
          }
        }
      }
    }
    squareElim(); //<>//
  }

  boolean W = true;
  //  for (int row =0; row<9; row++) {
  //    for (int column =0; column<9; column++) {
  //      if (sudokuState [column] [row]!=sudokuNumbers [column] [row]) {
  //        W = false;
  //        break;
  //      }
  //    }
  //    if (!W) {
  //      break;
  //    }
  //  }  
  return(sudokuState);
}


void squareElim() {
  for (int SquareX=0; SquareX<3; SquareX++) { //<>//
    for (int SquareY=0; SquareY<3; SquareY++) { //<>//
      nextValue:
      for (int value=0; value<9; value++) {          //<>//
        int possible = 0;
        int [] [] possibilities = new int [3] [3];  
        for (int row=0; row<3; row++) { //<>//
          for (int column=0; column<3; column++) {                      //<>//
            if (sudokuState [SquareX*3+column] [SquareY*3+row]==value+1) { //<>//
              continue nextValue;
            } else if (sudokuState [SquareX*3+column] [SquareY*3+row]==0) {                                 
              if (impossibleNumbers [SquareX*3+column] [SquareY*3+row] [value]==0) { //<>//
                possibilities [column] [row] = 1;
                possible++;
              }
            }
          }
        }        
        if (possible==1) {
          for (int row=0; row<3; row++) { //<>//
            for (int column=0; column<3; column++) { //<>//
              if(possibilities [column] [row]==1){ //<>//
                change=true;
                sudokuState [SquareX*3+column] [SquareY*3+row]=value+1;
              }
            }
          }
        }
      }
    }
  }
}

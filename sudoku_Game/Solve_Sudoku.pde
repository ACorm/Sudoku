int [] [] [] impossibleNumbers = new int [9] [9] [9];
IntList buffer;
int [] [] solveSudoku(int [] [] sudokuState) {
  boolean solved = false;
  while (!solved) {
    boolean change = false;
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
            if(buffer.size()==9){
              println("while trying to solve the maze the program realised it is impossible");
            }
          }
        }
      }
    }    
    solved=!change;
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

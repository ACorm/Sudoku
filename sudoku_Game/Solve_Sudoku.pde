boolean change = true; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
solveSudoku() {
  change = true;
  while (change) {
    change = false;
    for (int row=0; row<9; row++) {
      for (int column=0; column<9; column++) {
        if (sudokuCells [column] [row].value==0) {
          sudokuCells [column] [row].checkDigits();
          if (sudokuCells [column] [row].impossibleValues.size()==8) {
            for (int value=0; value<9; value++) {
              if (!sudokuCells [column] [row].impossibleValues.hasValue(value+1)) {
                change=true;
                sudokuCells [column] [row].value = value+1;
              }
            }
          } else {
            if (sudokuCells [column] [row].impossibleValues.size()==9) {
              println("while trying to solve the sudoku the program realised it is impossible");
            }
          }
        }
      }
    }
    group();
  }




  //boolean W = true;
  //  for (int row =0; row<9; row++) {
  //    for (int column =0; column<9; column++) {
  //      if (sudokuCells [column] [row].value!=sudokuCells [column] [row].endValue) {
  //        W = false;
  //        break;
  //      }
  //    }
  //    if (!W) {
  //      break;
  //    }
  //  }  
  ////return(sudokuState);
  
  //return(W);
}


void group() {
  int maxGroup=0;
  int minGroup=10;
  for (int rowValue=0; rowValue<9; rowValue++) {
    for (int columnValue=0; columnValue<9; columnValue++) {      
      if (sudokuCells [columnValue] [rowValue].impossibleValues.size()>0) {
        if (sudokuCells [columnValue] [rowValue].impossibleValues.max()>maxGroup) {
          maxGroup=sudokuCells [columnValue] [rowValue].impossibleValues.max();
        }
        if (sudokuCells [columnValue] [rowValue].impossibleValues.min()<minGroup) {
          minGroup=sudokuCells [columnValue] [rowValue].impossibleValues.min();
        }
      }
    }
  }
  for (int groups=minGroup; groups<maxGroup; groups++) {
  nextValue:
    for (int value=0; value<9; value++) {
      int [] list = new int [9];
      int listValue=0;
      int possibleValues =0;
      //boolean doneGroup = true;
      for (int columnCheck=0; columnCheck<9; columnCheck++) {
        for (int rowCheck=0; rowCheck<9; rowCheck++) {
          sudokuCells [columnCheck] [rowCheck].checkDigits();
          if (sudokuCells [columnCheck] [rowCheck].groupNumber.hasValue(groups)) {
            if (sudokuCells [columnCheck] [rowCheck].value!=0 || sudokuCells [columnCheck] [rowCheck].impossibleValues.hasValue(value+1)) {
              list [listValue]=1;
              if (sudokuCells [columnCheck] [rowCheck].value==value+1) {
                continue nextValue;
              }
            } else {
              possibleValues++;
            }
            //if (sudokuCells [columnCheck] [rowCheck].value==0) {
            //  doneGroup = false;
            //}
            listValue++;
          }
        }
      }
      if (listValue>8) {
        if (listValue==9) {
          if (possibleValues==1) {
            for (int columnCheck=0; columnCheck<9; columnCheck++) {
              for (int rowCheck=0; rowCheck<9; rowCheck++) {        
                if (sudokuCells [columnCheck] [rowCheck].groupNumber.hasValue(groups)) {
                  if (sudokuCells [columnCheck] [rowCheck].value==0 && !sudokuCells [columnCheck] [rowCheck].impossibleValues.hasValue(value+1)) {
                    sudokuCells [columnCheck] [rowCheck].value=value+1;
                    change=true;
                  }
                }
              }
            }
          }
        } else {
          println("while trying to solve the sudoku the program realised it is impossible because the group is larger than 9");
        }
      }
    }
  }
}


//void squareElim() {
//  for (int SquareX=0; SquareX<3; SquareX++) {
//    for (int SquareY=0; SquareY<3; SquareY++) {
//    nextValue:
//      for (int value=0; value<9; value++) {         
//        int possible = 0;
//        int [] [] possibilities = new int [3] [3];  
//        for (int row=0; row<3; row++) {
//          for (int column=0; column<3; column++) {                     
//            if (sudokuState [SquareX*3+column] [SquareY*3+row]==value+1) {
//              continue nextValue;
//            } else if (sudokuState [SquareX*3+column] [SquareY*3+row]==0) {                                 
//              if (impossibleNumbers [SquareX*3+column] [SquareY*3+row] [value]==0) {
//                possibilities [column] [row] = 1;
//                possible++;
//              }
//            }
//          }
//        }        
//        if (possible==1) {
//          for (int row=0; row<3; row++) {
//            for (int column=0; column<3; column++) {
//              if (possibilities [column] [row]==1) {
//                change=true;
//                sudokuState [SquareX*3+column] [SquareY*3+row]=value+1;
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//}

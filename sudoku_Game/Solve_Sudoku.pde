boolean change = true; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
boolean solveSudoku(boolean hint) {
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
                if (hint) {
                  return(false);
                }
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
                      if (hint) {
                        return(false);
                      }
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

  for (int row =0; row<9; row++) {
    for (int column =0; column<9; column++) {
      if (sudokuCells [column] [row].value!=sudokuCells [column] [row].endValue) {
        return(false);
      }
    }
  }    
  return(true);
}

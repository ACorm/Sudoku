boolean blocks =false; //<>//

int [] [] Rules = new int [] [] { 
  //               Middle \|/
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, //Middle
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
};

IntList relativeCheck(int column, int row) {
  IntList list;
  list = new IntList ();  
  for (int rowCheck=-8; rowCheck<9; rowCheck++) {
    for (int columnCheck=-8; columnCheck<9; columnCheck++) {
      if (Rules [columnCheck+8] [rowCheck+8]==1 && -1<row+rowCheck && row+rowCheck<9 && -1<column+columnCheck && column+columnCheck<9) {
        list.append(sudokuCells [column+columnCheck] [row+rowCheck].value);
      }
    }
  }  
  return(list);
}

IntList squareCheck(int column, int row) { //<>//
  IntList list;
  list = new IntList ();
  if (blocks) {
    for (int squareCheck=0; squareCheck<9; squareCheck++) {
      int valueCheck = sudokuCells [((squareCheck)/3)+3*(column/3)] [(squareCheck)%3+3*(row/3)].value;
      if (valueCheck!=0) {
        list.append(valueCheck);
      }
    }
  }
  return(list);
}

IntList groupCheck(int column, int row) {
  IntList list;
  list = new IntList();
  for (int groups=0; groups<(sudokuCells [column] [row].groupNumber).size(); groups++) {
    for (int columnCheck=0; column<9; column++) {
      for (int rowCheck=0; row<9; row++) {
        if (sudokuCells [columnCheck] [rowCheck].groupNumber.hasValue(sudokuCells [column] [row].groupNumber.get(groups))) {
          list.append(sudokuCells [columnCheck] [rowCheck].value);
        }
      }
    }
  }
  return(list);
}



//groups



int [] [] groups1 = new int [] []{
  {1, 1, 1, 2, 2, 2, 3, 3, 3}, 
  {1, 1, 1, 2, 2, 2, 3, 3, 3}, 
  {1, 1, 1, 2, 2, 2, 3, 3, 3}, 
  {4, 4, 4, 5, 5, 5, 6, 6, 6}, 
  {4, 4, 4, 5, 5, 5, 6, 6, 6}, 
  {4, 4, 4, 5, 5, 5, 6, 6, 6}, 
  {7, 7, 7, 8, 8, 8, 9, 9, 9}, 
  {7, 7, 7, 8, 8, 8, 9, 9, 9}, 
  {7, 7, 7, 8, 8, 8, 9, 9, 9} 
};

int [] [] groups2 = new int [] []{
  {10, 10, 10, 10, 10, 10, 10, 10, 10}, 
  {11, 11, 11, 11, 11, 11, 11, 11, 11}, 
  {12, 12, 12, 12, 12, 12, 12, 12, 12}, 
  {13, 13, 13, 13, 13, 13, 13, 13, 13}, 
  {14, 14, 14, 14, 14, 14, 14, 14, 14}, 
  {15, 15, 15, 15, 15, 15, 15, 15, 15}, 
  {16, 16, 16, 16, 16, 16, 16, 16, 16}, 
  {17, 17, 17, 17, 17, 17, 17, 17, 17}, 
  {18, 18, 18, 18, 18, 18, 18, 18, 18} 
};

int [] [] groups3 = new int [] []{
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27}, 
  {19, 20, 21, 22, 23, 24, 25, 26, 27} 
};

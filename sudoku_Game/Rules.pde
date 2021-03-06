int [] [] Rules = new int [] [] { 
  //               Middle \|/
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1}, //Middle
  {0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0} 
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

IntList groupCheck(int column, int row) {
  IntList list;
  list = new IntList();
  for (int groups=0; groups<sudokuCells [column] [row].groupNumber.size(); groups++) {
    for (int columnCheck=0; columnCheck<9; columnCheck++) {
      for (int rowCheck=0; rowCheck<9; rowCheck++) {        
        if (sudokuCells [columnCheck] [rowCheck].groupNumber.hasValue(sudokuCells [column] [row].groupNumber.get(groups))) {
          list.append(sudokuCells [columnCheck] [rowCheck].value);
        }
      }
    }
  }
  return(list);
}

IntList check(int column, int row){
  IntList list=new IntList();
  list.append(groupCheck(column,row));
  list.append(relativeCheck(column,row));
  list.sort();
  for(int i=list.size()-2;i>=0;i--){
    if(list.get(i)==list.get(i+1)){
      list.remove(i+1);
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

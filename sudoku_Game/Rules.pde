boolean blocks =false;

int [] [] Rules = new int [] [] { 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
};

IntList relativeCheck(int column, int row, int [] [] MazeState) {
  IntList list;
  list = new IntList ();   //<>// //<>// //<>//
  for (int rowCheck=-8; rowCheck<9; rowCheck++) {
    for (int columnCheck=-8; columnCheck<9; columnCheck++) {
      if (Rules [columnCheck+8] [rowCheck+8]==1 && -1<row+rowCheck && row+rowCheck<9 && -1<column+columnCheck && column+columnCheck<9) {
        list.append(MazeState [column+columnCheck] [row+rowCheck]);
      }
    }
  }  
  return(list);
}

IntList squareCheck(int row, int column, int [] [] MazeState) {
  IntList list; //<>// //<>// //<>//
  list = new IntList ();
  if (blocks) {
    for (int squareCheck=0; squareCheck<9; squareCheck++) {
      int valueCheck = MazeState [((squareCheck)/3)+3*(row/3)] [(squareCheck)%3+3*(column/3)];
      if (valueCheck!=0) {
        list.append(valueCheck);
      }
    }
  }
  return(list);
}

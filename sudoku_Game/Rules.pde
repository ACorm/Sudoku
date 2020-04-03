boolean rows = true;

boolean columns = true;

boolean blocks = true;

boolean X = false;


IntList rowCheck(int row,int [] [] MazeState) {
  IntList list;
  list = new IntList ();
  if(columns){
    //accidentally switched variables
  for (int rowCheck=0; rowCheck<9; rowCheck++) {
    if (MazeState [row] [rowCheck]!=0) {
      list.append(MazeState [row] [rowCheck]);
    }
  }
  }
  return(list);
}

IntList columnCheck(int column,int [] [] MazeState) {
  IntList list;
  list = new IntList ();
  if(rows){
  for (int columnCheck=0; columnCheck<9; columnCheck++) {
    if (MazeState [columnCheck] [column]!=0) {
      list.append(MazeState [columnCheck] [column]);
    }
  }
  }
  return(list);
}

IntList squareCheck(int row, int column,int [] [] MazeState) {
  IntList list;
  list = new IntList ();
  if(blocks){
  for (int squareCheck=0; squareCheck<9; squareCheck++) {
    int valueCheck = MazeState [((squareCheck)/3)+3*(row/3)] [(squareCheck)%3+3*(column/3)];
    if (valueCheck!=0) {
      list.append(valueCheck);
    }
  }
  }
  return(list);
}

IntList diagonallyAdjacentCheck(int row, int column,int [] [] MazeState) {
  IntList list;
  list = new IntList ();
  if(X){
  for (int diagonalCheck=0; diagonalCheck<4; diagonalCheck++) {
    int yMod = -1;
    int xMod = -1;
    if (diagonalCheck==0 || diagonalCheck==1) {
      xMod+=2;
    }
    if (diagonalCheck==1 || diagonalCheck==3) {
      yMod+=2;
    }
    if (row-xMod>-1 && row-xMod<9 && column-yMod>-1 && column-yMod<9) {
      list.append(MazeState [row-xMod] [column-yMod]);
    }
  }
  }
  return(list);
}

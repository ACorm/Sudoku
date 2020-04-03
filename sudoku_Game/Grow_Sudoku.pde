IntList impossibleDigits;  //<>//
IntList bufferList;
boolean back = false;
int [] [] newNumbers = new int [9] [9];
int [] [] [] preTriedDigits = new int [9] [9] [9];
int column=0;
int row=0;
int [] [] growSudoku() {
  for (column=0; column<9; column++) {
    for (row=0; row<9; row++) {
      int digit=0;
      while (digit==0) {        
        impossibleDigits = new IntList();        
        impossibleDigits.append(checkDigits(row,column,newNumbers));     
        boolean impossible = true;        
        for (int numberCheck = 1; numberCheck<10; numberCheck++) {
          if (!impossibleDigits.hasValue(numberCheck) && preTriedDigits [row] [column] [numberCheck-1]==0) {
            impossible=false;
          }
        }

        if (impossible) {
          if (back) {
            for (int num=0; num<9; num++) {
              preTriedDigits [row] [column] [num] = 0;
            }
          }
          column=column-1+floor((row+9)/10);
          row=(row+8)%9;
          if(column<0){
            println("with the rules you currently have selected it is impossible to generate a Sudoku");
            return(null);
          }
          impossibleDigits.clear();
          impossibleDigits.append(newNumbers [row] [column]);
          preTriedDigits [row] [column] [newNumbers [row] [column]-1] = 1;
          back=true;
          newNumbers [row] [column]=0;
        } else {
          back=false;
          digit=round(random(0.5, 9.5));
          while (impossibleDigits.hasValue(digit) || preTriedDigits [row] [column] [digit-1]!=0) {
            digit=round(random(0.5, 9.5));
          }
        }
      }
      //println("new #");
      newNumbers [row] [column]=digit;
    }
  }
  println("Done");
  return(newNumbers);
}

IntList checkDigits(int row, int column, int [] [] mazeState) {
  IntList list;
  list=new IntList ();
  list.append(rowCheck(row, mazeState));
  list.append(columnCheck(column, mazeState));
  list.append(squareCheck(row, column, mazeState));
  list.append(diagonallyAdjacentCheck(row, column, mazeState));
  list=removeDups(list);
  return(list);
}

IntList removeDups(IntList bufferList) { 
  IntList list;
  list = new IntList ();
  for (int add=0; add<bufferList.size(); add++) {
    if (!list.hasValue(bufferList.get(add)) && bufferList.get(add)!=0) {
      list.append(bufferList.get(add));
    }
  }
  return(list); //<>//
}

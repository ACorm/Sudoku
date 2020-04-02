IntList impossibleDigits;  //<>//
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
        rowCheck();
        columnCheck();
        squareCheck();
        diagonallyAdjacentCheck();
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
      newNumbers [row] [column]=digit;
    }
  }
  return(newNumbers);
}



void rowCheck() {
  for (int rowCheck=0; rowCheck<9; rowCheck++) {
    if (!impossibleDigits.hasValue(newNumbers [row] [rowCheck]) && newNumbers [row] [rowCheck]!=0) {
      impossibleDigits.append(newNumbers [row] [rowCheck]);
    }
  }
}

void columnCheck() {
  for (int columnCheck=0; columnCheck<9; columnCheck++) {
    if (!impossibleDigits.hasValue(newNumbers [columnCheck] [column]) && newNumbers [columnCheck] [column]!=0) {
      impossibleDigits.append(newNumbers [columnCheck] [column]);
    }
  }
}

void squareCheck() {
  for (int squareCheck=0; squareCheck<9; squareCheck++) {
    int valueCheck = newNumbers [floor((squareCheck)/3)+3*floor(row/3)] [(squareCheck)%3+3*floor(column/3)];
    if (!impossibleDigits.hasValue(valueCheck) && valueCheck!=0) {
      impossibleDigits.append(valueCheck);
    }
  }
}

void diagonallyAdjacentCheck(){
          for (int diagonalCheck=0; diagonalCheck<4; diagonalCheck++) {
          int yMod = -1;
          int xMod = -1;
          if (diagonalCheck==0 || diagonalCheck==1) {
            xMod+=2;
          }
          if (diagonalCheck==1 || diagonalCheck==3) {
            yMod+=2;
          }
          int valueCheck=0;
          if (row-xMod>-1 && row-xMod<9 && column-yMod>-1 && column-yMod<9) {
            valueCheck = newNumbers [row-xMod] [column-yMod];
          }
          if (!impossibleDigits.hasValue(valueCheck) && valueCheck!=0) {
            impossibleDigits.append(valueCheck);
          }
        }
}

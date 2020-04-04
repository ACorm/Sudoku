IntList impossibleDigits; 
IntList bufferList;
boolean back = false;
int [] [] newNumbers = new int [9] [9];
int [] [] [] preTriedDigits = new int [9] [9] [9];
int column=0;
int row=0;
int [] [] growSudoku() {
  int completion =0;
  for (column=0; column<9; column++) {
    for (row=0; row<9; row++) {      
      int digit=0;
      while (digit==0) {        
        impossibleDigits = new IntList();        
        impossibleDigits.append(checkDigits(row, column, newNumbers));     
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
          if (column<0) {
            println("with the rules you currently have selected it is impossible to generate a Sudoku");
            return(null);
          }
          impossibleDigits.clear();
          impossibleDigits.append(newNumbers [row] [column]);
          preTriedDigits [row] [column] [newNumbers [row] [column]-1] = 1;
          //print(completion + ", ");
          completion--;
          //background(0);
          textSize(50);
          stroke(255);
          text("." + 100*completion/81, width/2, height/2);
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
      completion++;
      //background(0);
      textSize(50);
      stroke(255);
      println("." + 100*completion/81, width/2, height/2);     
      newNumbers [row] [column]=digit;
    }
  }
  println("Done");
  return(newNumbers);
}

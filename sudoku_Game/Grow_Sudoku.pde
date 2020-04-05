boolean back = false;
void growSudoku() {
  //int completion =0;
  for (int column=0; column<9; column++) {
    for (int row=0; row<9; row++) {   
      sudokuCells [column] [row].checkDigits();
      while (sudokuCells [column] [row].value==0) {             
        if (sudokuCells [column] [row].impossibleValues.size()>8) {
          if (back) {
            sudokuCells [column] [row].impossibleValues.clear();
          }
          column=column-1+floor((row+9)/10);
          row=(row+8)%9;
          if (column<0) {
            println("with the rules you currently have selected it is impossible to generate a Sudoku");
          }
          if (!sudokuCells [column] [row].impossibleValues.hasValue(sudokuCells [column] [row].value)) {
            sudokuCells [column] [row].impossibleValues.append(sudokuCells [column] [row].value);
          }          
          ////print(completion + ", ");
          //completion--;
          ////background(0);
          //textSize(50);
          //stroke(255);
          //text("." + 100*completion/81, width/2, height/2);
          back=true;
          sudokuCells [column] [row].value=0;
        } else {
          back=false;
          int digit=round(random(0.5, 9.5));
          ;
          while (sudokuCells [column] [row].impossibleValues.hasValue(digit)) {
            digit=round(random(0.5, 9.5));
          }
          sudokuCells [column] [row].value=digit;
          //completion++;
          ////background(0);
          //textSize(50);
          //stroke(255);
          //println("." + 100*completion/81, width/2, height/2);
        }
      }
    }
  }
  println("Done");
  for(int column=0;column<9;column++){
    for(int row=0;row<9;row++){
      sudokuCells [column] [row].doneSolving();
    }
  }
}

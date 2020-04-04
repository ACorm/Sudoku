class cell {
  int row;
  int column;
  int value;
  int endValue;
  IntList impossibleValues;
  boolean highlighted = false;
  boolean starter = false;

  cell(int tempRow, int tempColumn) {
    row=tempRow;
    column=tempColumn;
  }

  void checkDigits(int [] [] mazeState) {
    IntList list;
    list=new IntList ();
    list.append(relativeCheck(row, column, mazeState));
    list.append(squareCheck(row, column, mazeState));
        IntList bufferList = list;
        for (int add=0; add<bufferList.size(); add++) {
      if (!list.hasValue(bufferList.get(add)) && bufferList.get(add)!=0) {
        list.append(bufferList.get(add));
      }
    }
    impossibleValues=list;    
  }

  void DrawCell() {
    pushMatrix();
    translate(squareDire/9.0*(column+0.5)+LOffset, squareDire-squareDire/9.0*(row+0.5)+DOffset);
    if (highlighted) {
      fill(highlightColor);
    } else {
      fill(0);
    }
    rect(0, 0, squareDire/9.0, squareDire/9.0);
    if (value!=0) {
      if (startingNumber) {
        fill(255);
      } else {
        fill(155);
      }
      text(value, 0, 0);
    }
    popMatrix();
  }
}

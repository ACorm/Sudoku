class cell {
  int row;
  int column;
  int value;
  int endValue;
  IntList impossibleValues;
  boolean highlighted = false;
  boolean starter = false;
  IntList groupNumber;

  cell(int tempRow, int tempColumn) {
    groupNumber=new IntList ();
    row=tempRow;
    column=tempColumn;
    if (groups1 [column] [row]!=0) {
      groupNumber.append(groups1 [column] [row]);
    }
    if (groups2 [column] [row]!=0) {
      groupNumber.append(groups2 [column] [row]);
    }
    if (groups3 [column] [row]!=0) {
      groupNumber.append(groups3 [column] [row]);
    }
  }

  void doneSolving() {
    endValue=value;
    //value=0;
  }


  void checkDigits() {
    IntList list;
    list=new IntList ();
    list.append(relativeCheck(column, row));
    list.append(squareCheck(column, row));
    list.append(groupCheck(column,row));
    IntList bufferList;
    bufferList = new IntList ();
    for (int add=0; add<list.size(); add++) {
      if (!bufferList.hasValue(list.get(add)) && list.get(add)!=0) {
        bufferList.append(list.get(add));
      }
    }
    impossibleValues=bufferList;
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
      if (starter) {
        fill(255);
      } else {
        fill(155);
      }
      text(value, 0, 0);
    }
    popMatrix();
  }
}

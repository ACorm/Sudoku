class cell {
  int row;
  int column;
  int value;
  int endValue;
  IntList impossibleValues = new IntList ();
  boolean highlighted = false;
  boolean starter = false;
  IntList groupNumber;
  boolean hint;

  cell(int tempColumn, int tempRow) {
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

  void doneGrowing() {
    endValue=value;
  }

  void doneComplicating() {
    if (value!=0) {
      starter=true;
    }
  }

  void checkDigits() {
    IntList list;
    list=new IntList ();
    list.append(check(column, row));
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
    stroke(120);
    rect(0, 0, squareDire/9.0, squareDire/9.0);
    if (value!=0) {
      if (starter) {
        fill(255);
      } else {
        if(hint){
          fill(200,50,10);
        }else{
        fill(155);
        }
      }
      text(value, 0, 0);
    }
    popMatrix();
  }
}

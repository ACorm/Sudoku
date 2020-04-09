int selectionMenu=0;
int scroll=0;
int menuSize=0;
boolean saved=false;

void Win() {
  background(0);
  fill(255);
  text("You Win", width/2, height/2-2.3*height/9);

  fill(200, 0, 0);
  rect(width/2, height/2, width/2, height/9);
  fill(255);
  text("New Sudoku", width/2, height/2);
  fill(200, 0, 0);
  rect(width/2, height/2+1.7*height/9, width/2, height/9);
  fill(255);
  text("PreMade", width/2, height/2+1.7*height/9);
  if (!custom) {
    fill(200, 0, 0);
    rect(width/2, height/2+2*1.7*height/9, width/2, height/9);  
    if (!saved) {
      fill(255);
      text("Save", width/2, height/2+2*1.7*height/9);
    } else {
      fill(150);
      text("Saved", width/2, height/2+2*1.7*height/9);
    }
  }
}

void DrawSelection() {
  background(0);
  switch(selectionMenu) {
    case(0):
    menuSize=2;
    fill(200, 0, 0);
    //stroke(200,50,20);
    rect(width/2, height/2-1.7*height/9, width/2, height/9);
    fill(255);
    text("New Sudoku", width/2, height/2-1.7*height/9);
    fill(200, 0, 0);
    rect(width/2, height/2+1.7*height/9, width/2, height/9);
    fill(255);
    text("Pre Made Sudoku", width/2, height/2+1.7*height/9);
    break;
    case(1):
    menuSize=Names.length+1;
    for (int customN =0; customN<Names.length; customN++) {
      fill(0, 0, 200);
      rect(width/2, height/2-(1-2*customN)*1.7*height/9+scroll, width/2, height/9);
      fill(255);
      text(Names [customN], width/2, height/2-(1-2*customN)*1.7*height/9+scroll);
    }
    fill(0, 0, 200);
    rect(width/2, height/2-(1-2*Names.length)*1.7*height/9+scroll, width/2, height/9);
    fill(255);
    text("Back", width/2, height/2-(1-2*Names.length)*1.7*height/9+scroll);
    break;
  }
}


void Loading() {
  background(0);
  fill(255);
  text("Loading . . .", width/2, height/2);
}


void mouseWheel(MouseEvent event) {
  if (event.getCount()>0) {
    scroll-=20;
  } else {
    scroll+=20;
  }  
  if (scroll>=0) {
    scroll=0;
  }
  if (scroll<=(4-2*menuSize)*1.7*height/9) {
    scroll=int((4-2*menuSize)*1.7*height/9);
  }
}

void mouseClicked() {
  switch(drawState) {
    case(0):
    switch(selectionMenu) {
      case(0):
      if (inBox(width/2, height/2-1.7*height/9, width/2, height/9)) {
        selectionMenu=2; 
        drawState=1;
        Loading();
        scroll=0;
      } else {
        if (inBox(width/2, height/2+1.7*height/9, width/2, height/9)) {
          selectionMenu=1;
          scroll=0;
        }
      }
      break;
      case(1):
      for (int customN =0; customN<Names.length+1; customN++) {
        if (inBox(width/2, height/2-(1-2*customN)*1.7*height/9+scroll, width/2, height/9)) {
          if (customN==Names.length) {
            selectionMenu=0;
          } else {
            custom=true;
            sudokuNumbers=sudoku(customN+1);
            selectionMenu=2; 
            drawState=1;
          }
        }
      }
      break;
    }
    break;
    case(3):
    if (inBox(width/2, height/2, width/2, height/9)) {
      //new Sudoku
      saved=false;
      custom=false;
      selectionMenu=2; 
      drawState=1;
      Loading();
      scroll=0;
    } else {
      if (inBox(width/2, height/2+1.7*height/9, width/2, height/9)) { 
        //preMade
        drawState=0;
        selectionMenu=1;
        scroll=0;
      } else {
        if (inBox(width/2, height/2+2*1.7*height/9, width/2, height/9)&&!custom) { 
          //save
          println("//Sudoku Name");
          println("public static final int[][] NAME = new int [] []{");
          for (cell [] column : sudokuCells) {
            print("{");
            for (cell row : column) {
              if (row.starter) {
                print(row.value + ",");
              } else {
                print(0 + ",");
              }
            }
            println("}"+",");
          }
          println("};");
          saved=true;
        }
      }
    }
    break;
  }
}


boolean inBox(float x, float y, float Width, float Height) {
  float LX =x-Width/2; 
  float RX =x+Width/2;
  float TY =y-Height/2;
  float BY =y+Height/2;
  return(mouseX<RX && mouseX>LX && mouseY<BY && mouseY>TY);
}

int selectionMenu=0;
int scroll=0;

void DrawSelection() {
  background(0);
  switch(selectionMenu) {
    case(0):
    fill(200, 0, 0);
    rect(width/2, height/2-1.7*height/9, width/2, height/9);
    fill(255);
    text("New Sudoku",width/2, height/2-1.7*height/9);
    fill(200, 0, 0);
    rect(width/2, height/2+1.7*height/9, width/2, height/9);
    fill(255);
    text("Pre Made Sudoku",width/2, height/2+1.7*height/9);
    break;
    case(1):
    for (int customN =0; customN<StartingNumbers.Names.length; customN++) {
      fill(0,0,200);
      rect(width/2, height/2-(1-2*customN)*1.7*height/9+scroll, width/2, height/9);
      fill(255);
      text(StartingNumbers.Names [customN],width/2, height/2-(1-2*customN)*1.7*height/9+scroll);
    }
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
  if (scroll<=(4-2*StartingNumbers.Names.length)*1.7*height/9) {
    scroll=int((4-2*StartingNumbers.Names.length)*1.7*height/9);
  }
}

void mouseClicked() {
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
        custom=true;
        scroll=0;
      }
    }
    break;
    case(1):
    for(int customN =0; customN<StartingNumbers.Names.length; customN++){
      if(inBox(width/2, height/2-(1-2*customN)*1.7*height/9+scroll, width/2, height/9)){
    selectionMenu=2; 
    drawState=1;
      }
    }
    break;
  default:
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

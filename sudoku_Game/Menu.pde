int selectionMenu=0;
int scroll=0;

void DrawSelection() {
  background(0);
  switch(selectionMenu) {
    case(0):
    fill(200, 0, 0);
    rect(width/2, height/2+1.7*height/9, width/2, height/9);
    fill(200, 0, 0);
    rect(width/2, height/2-1.7*height/9, width/2, height/9);
    break;
    case(1):
    for (int i =0; i<10; i++) {
      fill(255);
      rect(width/2, height/2-(1-2*i)*1.7*height/9+scroll, width/2, height/9);
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
  if (scroll<=height/2+(1-2*10)*1.7*height/9) {
    scroll=int(height/2+(1-2*10)*1.7*height/9);
  }
}

void mouseClicked() {
  switch(selectionMenu) {
    case(0):
    if (inBox(width/2, height/2+1.7*height/9, width/2, height/9)) {
      selectionMenu=2; 
      drawState=1;
      Loading();
      scroll=0;
    } else {
      if (inBox(width/2, height/2-1.7*height/9, width/2, height/9)) {
        selectionMenu=1;
        custom=true;
        scroll=0;
      }
    }
    break;
    case(1):
    selectionMenu=2; 
    drawState=1;

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



void keyPressed() {
  if (keyCode == KeyEvent.VK_ENTER) {
    saveFrame("snapshots/snapshot-####.png");
  }
  
  if (keyCode == KeyEvent.VK_O) {
    showOnView = !showOnView;
  } else if (keyCode == KeyEvent.VK_C) {
    showClassification = !showClassification;
  } else if (keyCode == KeyEvent.VK_V) {
    showCentury = !showCentury;
  } else if (keyCode == KeyEvent.VK_G) {
    showInGrid = !showInGrid;
  } else if (keyCode == KeyEvent.VK_I) {
    showImageCount = !showImageCount;
  } else if (keyCode == KeyEvent.VK_D) {
    showHasDescription = !showHasDescription;
  } else if (keyCode == KeyEvent.VK_1) {
    showClassificationID = 17;
  } else if (keyCode == KeyEvent.VK_2) {
    showClassificationID = 23;
  } else if (keyCode == KeyEvent.VK_3) {
    showClassificationID = 50;
  } else if (keyCode == KeyEvent.VK_4) {
    showClassificationID = 26;
  } else if (keyCode == KeyEvent.VK_5) {
    showClassificationID = 75;
  }
}





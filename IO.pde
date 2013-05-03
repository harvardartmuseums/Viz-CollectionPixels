

void keyPressed() {
  if (keyCode == KeyEvent.VK_ENTER) {
    saveFrame("snapshots/snapshot-####.png");
  }
  
  if (keyCode == KeyEvent.VK_H) {
    showInfoPanel = !showInfoPanel;
  }
  
  if (keyCode == KeyEvent.VK_O) {
    showOnView = !showOnView;
    infoPanelMessage = showOnView ? "objects are on view in the museum" : "";
  } else if (keyCode == KeyEvent.VK_C) {
    showClassification = !showClassification;
    infoPanelMessage = showClassification ? infoPanelMessage : "";
  } else if (keyCode == KeyEvent.VK_V) {
    showCentury = !showCentury;
  } else if (keyCode == KeyEvent.VK_G) {
    showInGrid = !showInGrid;
    infoPanelMessage = showInGrid ? "objects are featured online" : "";
  } else if (keyCode == KeyEvent.VK_I) {
    showImageCount = !showImageCount;
    infoPanelMessage = showImageCount ? "objects have one or more images" : "";
  } else if (keyCode == KeyEvent.VK_D) {
    showHasDescription = !showHasDescription;
    infoPanelMessage = showHasDescription ? "objects have a description" : "";
    
  } else if (keyCode == KeyEvent.VK_1) {
    showClassificationID = 17;
    infoPanelMessage = showClassification ? "objects are classified as photographs" : "";
  } else if (keyCode == KeyEvent.VK_2) {
    showClassificationID = 23;
    infoPanelMessage = showClassification ? "objects are classified as prints" : "";
  } else if (keyCode == KeyEvent.VK_3) {
    showClassificationID = 50;
    infoPanelMessage = showClassification ? "objects are classified as coins" : "";
  } else if (keyCode == KeyEvent.VK_4) {
    showClassificationID = 26;
    infoPanelMessage = showClassification ? "objects are classified as paintings" : "";
  } else if (keyCode == KeyEvent.VK_5) {
    showClassificationID = 75;
    infoPanelMessage = showClassification ? "objects are classified as calligraphy" : "";
  }
}





/*  Keyboard commands
    
    Enter - save a snapshot of the screen
    Space - reset all settings
    Left arrow - 
    Right arrow - 
    Up arrow - 
    Down arrow - 
    A - color and sort by Primary Color
    C - color and sort by Classification
    I - show artwork info panel
    O - highlight artworks currently on view
    P - show the info panel
    Q - sort by Pageviews descending
    R - sort by Rank
    V - color and sort by Verification Level
    
*/

void keyPressed() {
  if (keyCode == KeyEvent.VK_ENTER) {
    saveFrame("snapshots/snapshot-####.png");
    
  } else if (keyCode == KeyEvent.VK_UP) {
    artworkWidth +=1;
    artworkHeight +=1;
    
  } else if (keyCode == KeyEvent.VK_DOWN) {
    artworkWidth -=1;
    artworkHeight -=1;
    
  } else if (keyCode == KeyEvent.VK_SPACE) {
    showOnView = false;
    showClassification = false;
    showVerificationLevel = false;
    showPrimaryColor = false;
    
  }   else if (keyCode == KeyEvent.VK_P) {
    showInfoPanel = !showInfoPanel;
    
  } else if (keyCode == KeyEvent.VK_O) {
    showOnView = !showOnView;
    
  } else if (keyCode == KeyEvent.VK_I) {
    showArtworkInfoPanel = !showArtworkInfoPanel;    
  
} else if (keyCode == KeyEvent.VK_A) {
    showPrimaryColor = !showPrimaryColor;
    Collections.sort(artworks, Sorter.PrimaryColorComparator);
    arrangeArtworks();
    
  }  else if (keyCode == KeyEvent.VK_C) {
    showClassification = !showClassification;
    Collections.sort(artworks, Sorter.ClassificationComparator);
    arrangeArtworks();
    
  } else if (keyCode == KeyEvent.VK_V) {
    showVerificationLevel = !showVerificationLevel;
    Collections.sort(artworks, Sorter.VerificationLevelComparator);
    arrangeArtworks();
    
  } else if (keyCode == KeyEvent.VK_R) {
    Collections.sort(artworks, Sorter.RankComparator);
    arrangeArtworks();
    
  } else if (keyCode == KeyEvent.VK_Q) {
    Collections.sort(artworks, Sorter.PageviewComparator);
    arrangeArtworks();
    
  }
}





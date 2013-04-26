final static int artworkWidth = 3;
final static int artworkHeight = 3;
final static int spaceBetweenArtworks = 0;

int fillColorR = 100;
int fillColorG = 100;
int fillColorB = 100;

int numberOfArtworks = 220000;
int[] artworks; 
int[] classification;
int[] century;
int[] onView;
int[] inGrid;
int[] imageCount;
int[] hasDescription;
int[] hasCommentary;
int[] ax; 
int[] ay; 

boolean showOnView = false;
boolean showInGrid = false;
boolean showClassification = false;
boolean showCentury = false;
boolean showImageCount = false;
boolean showHasDescription = false;
boolean showHasCommentary = false;

int showClassificationID = 17;

HashMap classifications;

void setup() {
  size(screen.width, screen.height);
  //noLoop();
  
  loadData();
  loadLists();
     
  int posx = 0;
  int posy = 0;
  
  for(int i=0; i<numberOfArtworks; i++) {
    ax[i] = posx;
    ay[i] = posy;
    
    posx +=artworkWidth + spaceBetweenArtworks;
    if (posx >= width) {
      posx = 0;
      posy +=artworkHeight + spaceBetweenArtworks;
    }
  }
}

void draw() {
  background(255);
  for (int i=0; i<numberOfArtworks; i++) {
    fill(255);
    if (showOnView) {
      if (onView[i] == 1) {
        fill(fillColorR, fillColorG, fillColorB); 
      }
    }
    if (showInGrid) {
      if (inGrid[i] == 1) {
        fill(fillColorR, fillColorG, fillColorB);
      }
    }
    if (showImageCount) {
      if (imageCount[i] > 0) {
        fill(fillColorR, fillColorG, fillColorB);
      }
    }
    if (showHasDescription) {
      if (hasDescription[i] == 1) {
        fill(fillColorR, fillColorG, fillColorB);
      }
    }
    if (showClassification) {
      if (classification[i] == showClassificationID) {
        fill(fillColorR, fillColorG, fillColorB);
      }
    }
    if (showCentury) {
      if (century[i] == 111) {
        fill(fillColorR, fillColorG, fillColorB);
      }
    }
    noStroke();
    rect(ax[i], ay[i], artworkWidth, artworkHeight);
  }
}

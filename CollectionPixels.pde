import java.awt.event.KeyEvent;

final static int artworkWidth = 3;
final static int artworkHeight = 3;
final static int spaceBetweenArtworks = 0;

int fillColorR = 100;
int fillColorG = 100;
int fillColorB = 100;

int[] artworks; 
String[] classification;
String[] division;
int[] century;
int[] onView;
int[] imageCount;
int[] hasDescription;
int[] hasCommentary;
int[] ax; 
int[] ay; 

boolean showOnView = false;
boolean showClassification = false;
boolean showCentury = false;
boolean showImageCount = false;
boolean showHasDescription = false;
boolean showHasCommentary = false;

String selectedClassification = "Paintings";

boolean showInfoPanel = true;

int activatedArtworkCount = 0;
String infoPanelMessage = "";

PFont fontA;

HashMap classifications;

void setup() {
  size(displayWidth, displayHeight);
  //noLoop();
  
  loadData();
  loadLists();
     
  int posx = 0;
  int posy = 0;
  
  for(int i=0; i<artworks.length; i++) {
    ax[i] = posx;
    ay[i] = posy;
    
    posx +=artworkWidth + spaceBetweenArtworks;
    if (posx >= width) {
      posx = 0;
      posy +=artworkHeight + spaceBetweenArtworks;
    }
  }
  
  //Prepare the remaining odds and ends
  fontA = loadFont("CourierNew36.vlw");
  textFont(fontA, 15);  
}

void draw() {
  activatedArtworkCount = 0;
  
  background(255);
  for (int i=0; i<artworks.length; i++) {
    fill(255);
    if (showOnView) {
      if (onView[i] == 1) {
        fill(fillColorR, fillColorG, fillColorB); 
        activatedArtworkCount +=1;
      }
    }
    if (showImageCount) {
      if (imageCount[i] > 0) {
        fill(fillColorR, fillColorG, fillColorB);
        activatedArtworkCount +=1;        
      }
    }
    if (showHasDescription) {
      if (hasDescription[i] == 1) {
        fill(fillColorR, fillColorG, fillColorB);
        activatedArtworkCount +=1;
      }
    }
    if (showClassification) {
      if (selectedClassification.equals(classification[i])) {
        fill(fillColorR, fillColorG, fillColorB);
        activatedArtworkCount +=1;
      }
    }
    if (showCentury) {
      if (century[i] == 111) {
        fill(fillColorR, fillColorG, fillColorB);
        activatedArtworkCount +=1;
      }
    }
    noStroke();
    rect(ax[i], ay[i], artworkWidth, artworkHeight);
  }
  
  if (showInfoPanel) {
    noStroke();
    rect(0, height-60, width, 60);
    fill(0,80);
    text(activatedArtworkCount + " of " + artworks.length + " " + infoPanelMessage, 8, height-6);  
  }  
}

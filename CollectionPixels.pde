import java.awt.event.KeyEvent;
import java.util.*;

int artworkWidth = 3;
int artworkHeight = 3;
int spaceBetweenArtworks = 0;

color defaultColor = color(100);

ArrayList <Artwork> artworks;
HashMap <String, Integer> classifications;
HashMap <Integer, Integer> verificationLevels;
HashMap <String, Integer> cultures;

boolean showChrome = false;
boolean showOnView = false;
boolean showClassification = false;
boolean showVerificationLevel = false;
boolean showPrimaryColor = false;
boolean showInfoPanel = false;
boolean showArtworkInfoPanel = true;

Artwork selectedArtwork;

PFont font;

void setup() {
  fullScreen(P3D, SPAN);
  
  //Load the data
  verificationLevels = loadVerificationLevels();
  classifications = loadList("classification");
  cultures = loadList("culture");
  artworks = loadArtData();  

  //Set the initial layout
  arrangeArtworks();

  //Prepare the remaining odds and ends
  font = createFont("Arial", 18);
  textFont(font);
}

void draw() {
  background(255);

  for (Artwork a : artworks) {
    a.display();
    if (a.isOver()) {
      selectedArtwork = a;
    }
  }

  if (showInfoPanel) {
    noStroke();
    fill(255, 80);
    rect(0, height-60, width, 60);
    fill(0);
    text(artworks.size() + " artworks", 18, height-30);
  }
  
  if (showArtworkInfoPanel) {
    if (selectedArtwork != null) {
      selectedArtwork.displayHighlight();
      selectedArtwork.displayLabel();
    }
  }
}

void arrangeArtworks() {
  int posx = 0;
  int posy = 0;

  for (Artwork a : artworks) {
    a.setLocation(new PVector(posx, posy));

    posx +=artworkWidth + spaceBetweenArtworks;
    if (posx >= width) {
      posx = 0;
      posy +=artworkHeight + spaceBetweenArtworks;
    }
  }
}
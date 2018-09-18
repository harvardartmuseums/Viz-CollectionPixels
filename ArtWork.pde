public class Artwork {
  int objectID;
  int accessionYear;
  int imageCount;
  int division;
  int totalPageViews = 0;
  int totalUniquePageViews = 0;
  int totalEdits = 0;
  int floorNumber = -1;
  int rank = -1;
  int verificationLevel = -1;
  String galleryNumber = null;
  String classification;
  String culture;
  String century;
  String title;
  String colorHex = "";
  boolean onView = false;
  PVector location; 
  color primaryColor = color(100);
   
  public Artwork(JSONObject _record) {
    objectID = _record.getInt("objectid");
    classification = _record.getString("classification", "");
    century = _record.getString("century", "");
    culture = _record.getString("culture", "");
    title = _record.getString("title", "");
    totalPageViews = _record.getInt("totalpageviews", 0);
    verificationLevel = _record.getInt("verificationlevel", -1);
    rank = _record.getInt("rank", -1);
    accessionYear = _record.getInt("accessionyear", -1);

    try {
      floorNumber = _record.getJSONObject("gallery").getInt("floor", -1);
      galleryNumber = _record.getJSONObject("gallery").getString("gallerynumber", null);
    } catch(Exception ex) {}
        
    try {
      JSONArray colors = _record.getJSONArray("colors");
      colorHex = colors.getJSONObject(0).getString("color");
      primaryColor = unhex("FF" + colors.getJSONObject(0).getString("color").substring(1));
    } catch(Exception ex) {}
        
  }
  
  public void display() {
    noStroke();
    fill(defaultColor);
    
    if (showOnView && (floorNumber > -1)) {
      fill(0);
    }    
    if (showPrimaryColor) {
      fill(primaryColor);
    }
    if (showClassification) {
      fill(classifications.get(this.classification));
    }
    if (showVerificationLevel) {
      fill(verificationLevels.get(this.verificationLevel));
    }
    
//    fill(totalPageViews);
    
    rect(location.x, location.y, artworkWidth, artworkHeight);
  }
  
  public void displayHighlight() {
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(location.x-2, location.y-2, artworkWidth+2, artworkHeight+2);
  }
  
  public void displayLabel() {
    fill(0);
    text("Title: " + title + "\n" + 
          "Classification: " + classification + "\n" +
          "Accession Year: " + (accessionYear > -1 ? accessionYear : "") + "\n" +
          "Rank: " + rank + "\n" + 
          "Total Pageviews since 2009: " + totalPageViews + "\n" +
          "Primary color: " + colorHex, 
      location.x + 15, 
      location.y + 15);
  }
  
  public void setLocation(PVector _location) {
    location = _location;
  }

  public boolean isOver() {
    // Test if the cursor is over the box 
    if (mouseX >= location.x && mouseX <= location.x+artworkWidth && mouseY >= location.y && mouseY <= location.y+artworkHeight) {
      return true;
    } else {
      return false;
    }
  }  
}

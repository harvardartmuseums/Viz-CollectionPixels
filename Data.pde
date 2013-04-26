final static int OBJECT_ID = 0;
final static int OBJECT_ORDER = 1;
final static int DATE_BEGIN = 2;
final static int DATE_END = 3;
final static int CLASSIFICATION_ID = 4;
final static int CENTURY_ID = 5;
final static int PERIOD_ID = 6;
final static int CULTURE_ID = 7;
final static int IMAGE_PERMISSION_LEVEL = 8;
final static int IMAGE_COUNT = 9;
final static int DIVISION_ID = 10;
final static int IS_ON_VIEW = 11;
final static int IS_IN_GRID = 12;
final static int HAS_DESCRIPTION = 13;
final static int HAS_COMMENTARY = 14;

void loadData() {
  String bits[];
  String lines[] = loadStrings("data.csv");
  println("Loaded " + lines.length + " bits of data");
  
  artworks = new int[lines.length];
  onView = new int[lines.length];
  inGrid = new int[lines.length];
  imageCount = new int[lines.length];
  hasDescription = new int[lines.length];
  hasCommentary = new int[lines.length];
  classification = new int[lines.length];
  century =  new int[lines.length];
  ax = new int[lines.length];
  ay = new int[lines.length];  
  
  for(int i=0; i<lines.length; i++) {
    bits = split(lines[i], ",");
    
    //Store the ObjectID
    artworks[i] = int(bits[OBJECT_ID]);
    
    //Store the on view status (yes/no)
    onView[i] = int(bits[IS_ON_VIEW]);
    
    inGrid[i] = int(bits[IS_IN_GRID]);
    imageCount[i] = int(bits[IMAGE_COUNT]);
    hasCommentary[i] = int(bits[HAS_COMMENTARY]);
    hasDescription[i] = int(bits[HAS_DESCRIPTION]);    
    classification[i] = int(bits[CLASSIFICATION_ID]);
    century[i] = int(bits[CENTURY_ID]);
  }
  
  println("Done stepping through the data");
}

void loadLists() {
  classifications = new HashMap();
  
  String bits[];
  String lines[] = loadStrings("classifications.csv");
  println("Loaded " + lines.length + " bits of data");
  
  for(int i=0; i<lines.length; i++) {
    bits = split(lines[i], ",");
    
    classifications.put(bits[1], bits[0]);
  }
  
  println("Done stepping through the lists");
}

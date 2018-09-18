String apiKey = "";
String fields = "fields=objectid,totalpageviews,colors,classification,century,datebegin,dateend,accessionyear,culture,title,verificationlevel,gallery,images,rank,places,people,dateoflastpageview,dateoffirstpageview,primaryimageurl";
String size = "size=100";

ArrayList <Artwork> loadArtData(){
  ArrayList <Artwork> aos = new ArrayList <Artwork>(); 

  println("Started loading art data...");

  File file = new File(dataPath("") + "/json");
  File[] files = file.listFiles();
  if (files != null && files.length > 0) {
    println("Loading from " + files.length + " JSON files..."); 
    
    for (int i = 0; i < files.length; i++) { 
      JSONArray records = loadJSONArray(files[i]);
      for(int j=0;j<records.size();j++) {
        JSONObject record = records.getJSONObject(j);
        Artwork a = new Artwork(record);
        aos.add(a);
      } 
    }
    
  } else {  
    int currentPage = 1;
    String apiURL;
    apiURL = "http://api.harvardartmuseums.org/object?apikey=" + 
                      apiKey + "&" +
                      "q=accesslevel:1&" +
                      fields + "&" + 
                      size;
    
    // Get the initial set of data
    JSONObject data = loadJSONObject(apiURL);
    JSONArray records = data.getJSONArray("records");
      
    println("Found " + data.getJSONObject("info").getInt("totalrecords") + " records");
    
    while (records.size() > 0) {
      println("Processing page " + currentPage);
      
      saveJSONArray(records, "data/json/records-" + currentPage + ".json");
      
      for(int i=0;i<records.size();i++) {
        JSONObject record = records.getJSONObject(i);
        Artwork a = new Artwork(record);
        aos.add(a);
      }    
      
      // Get the next page of data
      currentPage += 1;    
      data = new JSONObject();
      records = new JSONArray();
      data = loadJSONObject(apiURL + "&page=" + currentPage);
      records = data.getJSONArray("records");
    }
  }
  
  println("Finished loading art data...");
  
  return aos;
}


HashMap <String, Integer> loadList(String listName) {
  HashMap <String, Integer> hm = new HashMap();

  int currentPage = 1;
  String apiURL;
  apiURL = "http://api.harvardartmuseums.org/" + listName + "?apikey=" + 
                      apiKey + "&" +
                      size;
    
  // Get the initial set of data
  JSONObject data = loadJSONObject(apiURL);
  JSONArray records = data.getJSONArray("records");
  Integer totalRecords = data.getJSONObject("info").getInt("totalrecords");
  
  println("Found " + totalRecords + " records");

  while (records.size() > 0) {
    println("Processing page " + currentPage);  
    for(int i=0;i<records.size();i++) {
      JSONObject record = records.getJSONObject(i);
      
      String name = record.getString("name");      
//      color c = color((int) map(name.length(), 0.0, totalRecords, 0.0, 255.0), 
//                      (int) map(name.length(), 0.0, totalRecords, 0.0, 255.0), 
//                      (int) map(name.length(), 0.0, totalRecords, 0.0, 255.0));
      color c = color((int) random(0, 255), 
                      (int) random(0, 255),  
                      (int) random(0, 255));
                      
      hm.put(name, c);
    }
      
    // Get the next page of data
    currentPage += 1;    
    data = new JSONObject();
    records = new JSONArray();
    data = loadJSONObject(apiURL + "&page=" + currentPage);
    records = data.getJSONArray("records");
  }
  
  println("Done stepping through the lists");
  return hm;
}

HashMap <Integer, Integer> loadVerificationLevels() {
 HashMap <Integer, Integer> hm = new HashMap();
 
 for (int i=-1;i<5;i++) {
   color c = color((int) random(0, 255), 
                  (int) random(0, 255),  
                  (int) random(0, 255));
   hm.put(i, c);
 } 
 
 return hm;
}

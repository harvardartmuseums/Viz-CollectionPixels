public static class Sorter { 
  public Sorter() {}
 
  public static Comparator<Artwork> ClassificationComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
      String v1 = a1.classification.toUpperCase();
      String v2 = a2.classification.toUpperCase();
      
      return v1.compareTo(v2);
    }    
  };
 
  public static Comparator<Artwork> CultureComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
      String v1 = a1.culture.toUpperCase();
      String v2 = a2.culture.toUpperCase();
      
      return v1.compareTo(v2);
    }    
  };  
 
  public static Comparator<Artwork> RankComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
      int v1 = a1.rank;
      int v2 = a2.rank;
      
      return v1-v2;
    }    
  };  
 
  public static Comparator<Artwork> PageviewComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
      int v1 = a1.totalPageViews;
      int v2 = a2.totalPageViews;
      
      return v2-v1;
    }    
  };  
 
  public static Comparator<Artwork> VerificationLevelComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
      int v1 = a1.verificationLevel;
      int v2 = a2.verificationLevel;
      
      return v1-v2;
    }    
  }; 
 
  public static Comparator<Artwork> PrimaryColorComparator = new Comparator<Artwork>() {
    public int compare(Artwork a1, Artwork a2) {
//      String v1 = a1.colorHex.toUpperCase();
//      String v2 = a2.colorHex.toUpperCase();
//      
//      return v1.compareTo(v2);
      
      int v1 = a1.primaryColor;
      int v2 = a2.primaryColor;
      
      return v1-v2;     
    }    
  }; 
}

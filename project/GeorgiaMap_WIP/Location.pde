/**
  Class to construct and store lon/lat data for a specific location
*/

class Location {
  
  float lon; // longitude
  float lat; // latitude
  
  // input takes the form: " -85.605202   30.355408", 
  // on its own line with spaces as shown
  Location(String s) {
    String[] vals = split(s, " ");
    lon = float(vals[1]);
    lat = float(vals[4]);
  } 
}


/** 

  Creates a java.awt.Polygon object to hold the county's
  boundary vertices in screen coordinates.
    
  This approach was taken since the java's polygon class offers
  a contains(...) method which tests for containment of a point. Since
  point-in-polygon calculations can be complex, it was advantageous to
  encapsulate the Polygon class with this SketchCounty class to take
  advantage of Polygon's functionality.
  
  */

class SketchCounty {
  
  Polygon poly;           //the polygon
  Subregion subregion;    // the subregion from which this polygon populates its data
  SketchMap map;          // the SketchMap object to which this SketchCounty belongs
  
  // constructor called with references to the associated Subregion and SkethcMap objects
  SketchCounty(Subregion _subregion, SketchMap _map) {
    subregion = _subregion;
    map = _map;
    poly = new Polygon();
    for (Location loc : _subregion.getLocations()) { // populate all locs based on
      addLocation(loc);                              // corresponding subregion
    }
  }
  
  // wrapper to get at Polygon's contains(...) method
  boolean contains(int x, int y) {
    return poly.contains(x, y);
  }
  
  int getX(int i) {
    return poly.xpoints[i];
  }
  
  int getY(int i) {
    return poly.ypoints[i];
  }
  
  /**
    Polygon (poly) is populated with location provided.
    
    @param _location lon/lat provided
  */
  void addLocation(Location _location) {
    Region reg = subregion.region;
    float x = map(_location.lon, reg.min.lon, reg.max.lon,  // convert to screen coords
      0+map.bordLeft, width-map.bordRight);
    float y = map(_location.lat, reg.min.lat, reg.max.lat,  // convert to screen coords
      height-map.bordBottom, 0+map.bordTop);
    poly.addPoint((int)x, (int)y);
  } 

  // provide the number points in this county's boundary
  int getNumVerts() {
    return poly.npoints;
  }
  
  //retrieves the name from the underlying/associated subregion object
  String getName() {
    return subregion.getName();
  }
  
}

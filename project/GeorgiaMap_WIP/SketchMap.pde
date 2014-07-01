/**
  This class is constructed by calling the constructor with 
  a Region object.
  
  Where the Region (and Subregion) objects will maintain the 
  region data in lon/lat coordinates, this class will reference
  the geometry in screen coordinates.
  
  This class also maintains the borders and UI components of the
  screen space.
  
*/

class SketchMap {
  
  Region region;           // maintains a reference to the region that
                           // is associated with the SketchMap object
  SketchCounty[] counties; //counties, in screen coordinates
  int bordTop = 30;
  int bordBottom = 100;
  int bordLeft = 30;
  int bordRight = 30;

  // Constructor, based on a lon/lat region
  SketchMap(Region _region) {
    region = _region;
    Subregion[] subs = region.getSubregions();
    counties = new SketchCounty[subs.length];
    for (int i = 0; i < subs.length; i++) 
      counties[i] = (new SketchCounty(subs[i], this));
  }
  
  void draw(int mx, int my) {
    
    for (SketchCounty county : counties) {
      if (!county.contains(mx,my)) { 
        color thisColor = county.myColor;
        fill(red(thisColor),green(thisColor),blue(thisColor),alpha(thisColor));
        drawCounty(county);
      } else {
        fill(255,0,0,127); 
        drawCounty(county);
      }
    }
  }
 
 private void drawCounty(SketchCounty _c) {
   strokeWeight(1);
   stroke(0,255,0);
   beginShape();
   for (int i = 0; i < _c.getNumVerts(); i++) 
     vertex(_c.getX(i), _c.getY(i));
   endShape(CLOSE);
 }
 
  void setCountyColor(String _county, color _c) {
   for (int i = 0; i < sketchMap.counties.length; i++) {
    if (sketchMap.counties[i].getName().equals(_county)) {
      sketchMap.counties[i].setColor(_c);
    }
   }
  }
  
  color getCountyColor(String _county) {
   for (int i = 0; i < sketchMap.counties.length; i++) {
    if (sketchMap.counties[i].getName().equals(_county)) {
      return sketchMap.counties[i].getColor();
    }
   }
   // handle unrecognized county name
   return Color.BLACK;
  }
  
  String getCountyNameAt(int mx, int my) {
    for (int i = 0; i < sketchMap.counties.length; i++) {
      if (sketchMap.counties[i].contains(mx,my)) {
        return sketchMap.counties[i].getName();
      }
    }
    return "Pick a county";
  }
  
 
}


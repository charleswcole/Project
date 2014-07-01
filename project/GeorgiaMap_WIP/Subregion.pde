import java.awt.Polygon;

/**
  This class is constructed by calling the constructor with 
  a the name, parent region and size (in vertices) of this region.
  
  Vertices are then added by making successive calls to addLocation(..),
  providing lon/lat data.
  
  This class will maintain the subregion data in lon/lat coordinates.
  
*/

class Subregion {
  
  String name;            // for example, if the region is Ga then the subregion
                          //     names would be "Fulton", "Gwinnett", etc.
  Region region;          // the region to which this subregion belongs
  Location[] locations;   // array to store the boundary vertices
  int nextIndex = 0;      // keeps track of the next vacant position in locations[]
  
  
  Subregion(String _name, Region _region, int _size) {
    name = _name;
    region = _region;
    locations = new Location[_size];
  }

  void addLocation(Location _location){
    locations[nextIndex] = _location;
    nextIndex++;
  } 
  
  Location[] getLocations() {
    return locations;
  }
  
  String getName() {
    return name;
  }
 
}


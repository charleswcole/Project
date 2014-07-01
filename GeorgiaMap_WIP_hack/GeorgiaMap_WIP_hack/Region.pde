import java.util.Scanner;
import java.io.FileNotFoundException;

/** 
   This class will read a geography file provided by 
   http://nifty.stanford.edu/2014/wayne-purple-america/
   and create regions and subregions based on the data 
   retrieved. In the case of GA.txt, Georgia is the region
   and the counties are the subregions.
   
   Note that this class creates subregions with all coordinates
   established and maintained as global lon/lat values.
   
   Ojects of this class are intneded to be coupled with SketchMap 
   and SketchCounty objects which will deal with the county coordinates
   in screen space.
   
*/
class Region {
  
  Location min; // min lon/lat of the bounding rectangle
  Location max; // max lon/lat of the bounding rectangle
  Subregion[] subregions; 
 
  /* Constructor should ne called with "GA", "NJ". etc. 
     Note that the corresponding data file needs to be loaded
     in the Processing project.
   */
  Region(String _twoLetterAbbreviation) {
    readFile(_twoLetterAbbreviation);
  }
  
  /*** reads the file and creates the corresponding subregion objects
    @param twoLetter two letter code, like "GA", "NJ", etc. 
  */
  void readFile(String _twoLetter) {
    File file = dataFile(_twoLetter + ".txt");
    try {
      Scanner scan = new Scanner(file);
      
      // process header
      //get min lon/lat, max lon/lat
      min = new Location(scan.nextLine());
      max = new Location(scan.nextLine());
      int numSubregions = scan.nextInt();
      scan.nextLine(); // read past empty line
      scan.nextLine(); // read past empty line
      
      //create array for all counties
      subregions = new Subregion[numSubregions];
      
      //process subregions (counties in our case)
      for (int i = 0; i < numSubregions; i++) {
        String name = scan.nextLine();
        String region = scan.nextLine();
        int numPoints = scan.nextInt();
        scan.nextLine(); // read past empty line
        Subregion subregion = new Subregion(name, this, numPoints);
        for(int j = 0; j < numPoints; j++) {
          String line = scan.nextLine();
          subregion.addLocation(new Location(line));
        }
        scan.nextLine(); // read past empty line
        subregions[i] = subregion;
      }
    } catch (FileNotFoundException fnfe) {
      println("File " + _twoLetter + ".txt" + " not found");
      noLoop();
    }
  }
  

  Subregion[] getSubregions() {
    return subregions;
  }
  
  /**
      useful for determining the aspect ratio of the bounding rectangle 
   */
  float getAspectRatio() { // width to height
    return (max.lon - min.lon) / (max.lat - min.lat);
  }
}


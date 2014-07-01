import java.awt.Color;

// this is a variation of the GeorgiaMap_WIP sketch that experiments with
// setting color values for counties that persist and sets up a simple toggle button
// to exercise the color functionality

// this is not pretty code, it's a bit of a hack

// use if you can

SketchMap sketchMap;

 // create a primitive button
  int bx = 400;
  int by = 400;
  int bw = 50;
  int bh = 25;

void setup() {
  Region ga = new Region("GA");
  size((int)(ga.getAspectRatio() * 500), 500);
  sketchMap = new SketchMap(ga);
  textSize(36);
  textAlign(CENTER, CENTER);

  
  sketchMap.setCountyColor("Dekalb", Color.RED);
  
}

void draw() {
  background(127);
  sketchMap.draw(mouseX, mouseY);
  
  fill(255);
  rect(bx,by,bw,bh);
  textSize(13);
  fill(0);
  text("Toggle", bx+0.5*bw, by+0.5*bh);
}

void mouseClicked() {
  //test to see if we're on the button
  // if so, toggle the state of Gwinnett
  if (mouseX > bx && mouseX < bx+bw && mouseY > by && mouseY < by+bh) {
    if (sketchMap.getCountyColor("Gwinnett") == Color.MAGENTA) {
      sketchMap.setCountyColor("Gwinnett", new Color(0,0,0,0));
    } else {
      sketchMap.setCountyColor("Gwinnett", Color.MAGENTA);
    }
  }
}


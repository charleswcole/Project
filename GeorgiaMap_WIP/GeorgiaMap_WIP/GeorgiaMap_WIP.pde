
SketchMap sketchMap;

void setup() {
  Region ga = new Region("GA");
  size((int)(ga.getAspectRatio() * 500),500);
  sketchMap = new SketchMap(ga);
  textSize(36);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(127);
  sketchMap.draw(mouseX, mouseY);
}



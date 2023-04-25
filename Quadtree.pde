ArrayList<Point> points;
QuadNode quadTree; // Root of the Quadtree
Range randomRange;

void setup() {
  size(800, 600);
  points = new ArrayList<>();
  Range treeRange = new Range(0.0, 0.0, (float)width, (float)height);
  quadTree = new QuadNode(treeRange, 8);
  // The range should be around the middle of the screen
  randomRange = new Range(random(width/3, width-width/3), random(height/3, height-height/3), random(100, 400), random(100, 400));
}

void draw() {
  background(0);
  quadTree.show();
  stroke(0, 255, 0);
  noFill();
  rect(randomRange.xStart, randomRange.yStart, randomRange.xSize, randomRange.ySize);
  for (Point p : points) {
    fill(255, 0, 0);
    noStroke();
    circle(p.x, p.y, 6);
  }
  ArrayList<Point> pointsInRandomRange = quadTree.getPointsInRange(randomRange);
  for (Point p : pointsInRandomRange) {
    // The new color overlaps the old one
    fill(0, 255, 0);
    noStroke();
    circle(p.x, p.y, 6);
  }
  textSize(20);
  fill(255);
  text((int)frameRate, 20, 20);
}

void mousePressed() {
  Point p = new Point(mouseX, mouseY);
  points.add(p);
  quadTree.addPoint(p);
}

void mouseDragged() {
  Point p = new Point(mouseX, mouseY);
  points.add(p);
  quadTree.addPoint(p);
}

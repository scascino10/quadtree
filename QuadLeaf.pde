class QuadLeaf extends GeneralQuadNode {
  Point[] points;
  int index;

  QuadLeaf(Range range, int maxPoints) {
    this.range = range;
    points = new Point[maxPoints];
    index = 0;
  }

  void addPoint(Point p) {
    points[index++] = p;
  }

  Point[] getPoints() {
    Point[] ps = new Point[index];
    for (int i = 0; i < index; i++) {
      ps[i] = points[i];
    }
    return ps;
  }

  int getNumPoints() {
    return index;
  }
  
  ArrayList<Point> getPointsInRange(Range range) {
    ArrayList<Point> pointsInRange = new ArrayList<>();    
    for (int i = 0; i < index; i++) {
      if (range.contains(points[i])) {
        pointsInRange.add(points[i]);
      }
    }
    return pointsInRange;
  }

  void show() {
    stroke(255);
    fill(0);
    rect(range.xStart, range.yStart, range.xSize, range.ySize);
  }
}

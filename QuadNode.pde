class QuadNode extends GeneralQuadNode {
  int maxLocalPoints;
  GeneralQuadNode[] children;

  QuadNode(Range range, int maxLocalPoints) {
    this.range = range;
    this.maxLocalPoints = maxLocalPoints;
    children = createEmptyChildrenLeafNodes();
  }

  GeneralQuadNode[] createEmptyChildrenLeafNodes() {
    GeneralQuadNode[] children = new GeneralQuadNode[4];
    float childrenXRangeSize = range.xSize / 2;
    float childrenYRangeSize = range.ySize / 2;
    int i = 0;
    for (int y = 0; y < 2; y++) {
      for (int x = 0; x < 2; x++) {
        float childXStart = range.xStart + childrenXRangeSize * x;
        float childYStart = range.yStart + childrenYRangeSize * y;
        Range range = new Range(childXStart, childYStart, childrenXRangeSize, childrenYRangeSize);
        children[i++] = new QuadLeaf(range, maxLocalPoints);
      }
    }
    return children;
  }

  void addPoint(Point p) {
    for (int i = 0; i < 4; i++) {
      if (children[i].range.contains(p)) {
        if (children[i].getNumPoints() == maxLocalPoints) {
          assert(children[i] instanceof QuadLeaf);
          Point[] points = ((QuadLeaf)children[i]).getPoints();
          Range childRange = children[i].range;
          children[i] = new QuadNode(childRange, maxLocalPoints);
          for (Point childPoint : points) {
            children[i].addPoint(childPoint);
          }
        }
        children[i].addPoint(p);
        break;
      }
    }
  }

  int getNumPoints() {
    int numPoints = 0;
    for (GeneralQuadNode child : children) {
      numPoints += child.getNumPoints();
    }
    return numPoints;
  }

  ArrayList<Point> getPointsInRange(Range range) {
    ArrayList<Point> pointsInRange = new ArrayList<>();
    for (GeneralQuadNode child : children) {
      if (child.range.overlaps(range)) {
        ArrayList<Point> childPoints = child.getPointsInRange(range);
        pointsInRange.addAll(childPoints);
      }
    }
    return pointsInRange;
  }

  void show() {
    for (GeneralQuadNode child : children) {
      child.show();
    }
  }
}

abstract class GeneralQuadNode {
  Range range;
  abstract void addPoint(Point p);
  abstract int getNumPoints();
  abstract ArrayList<Point> getPointsInRange(Range range);
  abstract void show();
}

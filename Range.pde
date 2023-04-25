class Range {
  float xStart, yStart, xSize, ySize, xEnd, yEnd;

  Range(float xStart, float yStart, float xSize, float ySize) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.ySize = ySize;
    this.xSize = xSize;
    xEnd = xStart + xSize;
    yEnd = yStart + ySize;
  }
  
  boolean contains(Point p) {
    return p.x >= xStart && p.x <= xEnd && p.y >= yStart && p.y <= yEnd;
  }
  
  boolean overlaps(Range other) {
    return xStart < other.xEnd && xEnd > other.xStart && yStart < other.yEnd && yEnd > other.yStart; 
  }
}

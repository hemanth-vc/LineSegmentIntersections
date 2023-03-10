
// Class to hold an Axis Aligned Bounding Box
static class AABB{

  float minX, maxX;
  float minY, maxY;
  
  AABB( float _minX, float _maxX, float _minY, float _maxY ){
    minX = _minX;
    maxX = _maxX;
    minY = _minY;
    maxY = _maxY;
  }
  
  public float getMaxy() { return maxY; }
  boolean intersectionTest( AABB other ){
    // TODO: Implement A Method To Find The Intersection Between 2 Axis Aligned Bounding Boxes
    float xmax = this.minX < other.minX ? other.minX : this.minX;
    float xmin = this.maxX < other.maxX ? this.maxX : other.maxX;
    float ymax = this.minY < other.minY ? other.minY : this.minY;
    float ymin = this.maxY < other.maxY ? this.maxY : other.maxY;
    
    if(ymin - ymax >=0 && xmin - xmax >= 0)
    {
      return true;
    }
    
    return false;
  }
  
}

static class Event implements Comparable<Event>{

  int pos;
  float y;
  int index;
  
  @Override public int compareTo(Event event) {
        return (int)(this.y - event.y);
  }
  Event(int _pos,float _y, int _index) 
  {
    pos=_pos;
    y=_y;
    index=_index;
  }
  
}

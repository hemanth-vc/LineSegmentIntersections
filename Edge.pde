

class Edge{
  
   Point p0,p1;
   AABB aabb;
   float minx,maxx,miny,maxy;
   
   Edge(Point _p0, Point _p1 ){
     p0 = _p0;
     p1 = _p1;
     
     if(p0.p.x < p1.p.x)
     {
       minx = p0.p.x;
       maxx = p1.p.x;
     }
     else
     {
       minx = p1.p.x;
       maxx = p0.p.x;
     }
     
     if(p0.p.y < p1.p.y)
     {
       miny = p0.p.y;
       maxy = p1.p.y;
     }
     else
     {
       miny = p1.p.y;
       maxy = p0.p.y;
     }
     
     aabb = new AABB(minx,maxx,miny,maxy);
     // TODO: Initialize AABB
     // aabb = new AABB( ... );
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   AABB getAABB(){
     return aabb;
   }
   
   float crossProd(float x1, float y1, float x2, float y2) {
        return x1 * y2 - x2 * y1;
    }
   
   boolean intersectionTest( Edge other ){
     // TODO: Implement A Method To Find If Edges Intersect using the cross product approach.
     // Should return true if intersecting and false otherwise.
        Point p1 = this.p0, p2 = this.p1, p3 = other.p0, p4 = other.p1;

        float det1 = crossProd(p4.p.x - p3.p.x, p4.p.y - p3.p.y, p1.p.x - p3.p.x, p1.p.y - p3.p.y);
        float det2 = crossProd(p4.p.x - p3.p.x, p4.p.y - p3.p.y, p2.p.x - p3.p.x, p2.p.y - p3.p.y);
        float det3 = crossProd(p2.p.x - p1.p.x, p2.p.y - p1.p.y, p3.p.x - p1.p.x, p3.p.y - p1.p.y);
        float det4 = crossProd(p2.p.x - p1.p.x, p2.p.y - p1.p.y, p4.p.x - p1.p.x, p4.p.y - p1.p.y);

        if (det1 >= 0 && det2 <= 0 || det1 <= 0 && det2 >= 0){if (det3 >= 0 && det4 <= 0 || det3 <= 0 && det4 >= 0) {
                return true;
            }
        }
     return false;    
   } 
   Point intersectionPoint( Edge other ){
     // TODO: Implement A Fast Method To Find The Edge Intersection Point.
     // Should return the intersection point or null, if no intersection exists.
     //  Care should be taken to make the implementation CORRECT, but SPEED MATTERS.
     
/* float d = (other.p1.getX() - other.p0.getX()) * (this.p1.getY() - this.p0.getY()) - (other.p1.getY() - other.p0.getY()) * (this.p1.getX() - this.p0.getX());
    if (d == 0) {
      return null;
    }
    float ta = ((other.p1.getY() - other.p0.getY()) * (other.p1.getX() - this.p0.getX()) + (other.p0.getX() - other.p1.getX()) * (other.p1.getY() - this.p0.getY())) / d;
    float tb = ((this.p1.getY() - this.p0.getY()) * (other.p1.getX() - this.p0.getX()) + (this.p0.getX() - this.p1.getX()) * (other.p1.getY() - this.p0.getY())) / d;
    if (ta >= 0 && ta <= 1 && tb >= 0 && tb <= 1) {
      Point intersection = new Point(this.p0.getX() + ta * (this.p1.getX() - this.p0.getX()), this.p0.getY() + ta * (this.p1.getY() - this.p0.getY()));
      return intersection;
    }
*/

/*     Point intersect = null;
     
     float tx = (other.p0.p.x - other.p1.p.x)/(this.p1.p.x-this.p0.p.x+other.p0.p.x - other.p1.p.x);
     float ty = (other.p0.p.y - other.p1.p.y)/(this.p1.p.y-this.p0.p.y+other.p0.p.y - other.p1.p.y);
     
     if (tx>=0 && tx<=1 && ty>=0 && ty<=1)
     {
       float x = this.p0.p.x - tx * this.p0.p.x + tx * this.p1.p.x;
       float y = this.p0.p.y - ty * this.p0.p.y + ty * this.p1.p.y;
       intersect =  new Point(x,y);
       return intersect;
     }
     
*/     
     
     
     if(this.intersectionTest(other))
     {
       
       float x1 = this.p0.p.x, x2 = this.p1.p.x, x3 = other.p0.p.x, x4 = other.p1.p.x;
     float y1 = this.p0.p.y, y2 = this.p1.p.y, y3 = other.p0.p.y, y4 = other.p1.p.y;

     float t = (((x1-x3)*(y3-y4))-((y1-y3)*(x3-x4))) / (((x1-x2)*(y3-y4))  - ((y1-y2)*(x3-x4)));
     //float u = (((x1-x3)*(y1-y2))-((y1-y3)*(x1-x2))) / (((x1-x2)*(y3-y4))  - ((y1-y2)*(x3-x4)));
     
     if(t<=1 || t>=0)
     {
       float x = x1+t*(x2-x1);
       float y = y1+t*(y2-y1);
       
       return new Point(x, y);
     }
       
     /*float a1 = this.p1.p.y-this.p0.p.y;
        float b1 = this.p0.p.x-this.p1.p.x;
        float c1 = a1*(this.p0.p.x) + b1*(this.p0.p.y);
      
        float a2 = other.p1.p.y-other.p0.p.y;
        float b2 = other.p0.p.x-other.p1.p.x;
        float c2 = a2*(other.p0.p.x)+ b2*(other.p0.p.y);
      
        float determinant = a1*b2 - a2*b1;
        if(determinant!=0)
        {
          float x = (b2*c1 - b1*c2)/determinant;
            float y = (a1*c2 - a2*c1)/determinant;
            
            //if(x>=this.p0.p.x && x<=this.p1.p.x && x>=other.p0.p.x && x<=other.p1.p.x && y>=this.p0.p.y && y<=this.p1.p.y && y>=other.p0.p.y && y<=other.p1.p.y)
            return new Point(x, y);
        }
        */
     }
     
     return null;
   }
   
}


// Function to make a set of random edges
void makeRandomSegmentsVersion1( int numOfEdges, float max_length ){
  points.clear();
  edges.clear();
  
  for( int i = 0; i < numOfEdges; i++ ){
    Point p0 = new Point( random(150,650), random(150,650) );
    Point p1 = new Point( PVector.fromAngle( random(0,2*PI) )
                                 .mult( random(10,max_length) )
                                 .add(p0.p) );
    points.add( p0 );
    points.add( p1 );
    edges.add( new Edge( points.get(i*2), points.get(i*2+1) ) );
  }
}


// Function to make a set of random edges
void makeRandomSegmentsVersion2( int numOfEdges ){
  points.clear();
  edges.clear();

for( int i = 0; i < numOfEdges; i++ ){
    Point p0 = new Point( random(150,650), random(150,650) );
    Point p1 = new Point( PVector.fromAngle( random(0,2*PI) )
                                .mult( random(10,250) ));
    points.add( p0 );
    points.add( p1 );
    edges.add( new Edge( points.get(i*2), points.get(i*2+1) ) );
}
  // TODO: Complete this function
}



// Function to make a set of random edges
void makeRandomSegmentsVersion3( int numOfEdges ){
  points.clear();
  edges.clear();
  for( int i = 0; i < numOfEdges; i++ ){
    Point p0 = new Point( random(100,700), random(150,650) );
    Point p1 = new Point( PVector.fromAngle( random(0,2*PI) )
                                .mult( random(10,250) ).add(p0.p));
                                
    Point p2 = new Point( PVector.fromAngle( random(0,2*PI) )
                                 .mult( random(10,250) )
                                 .add(p1.p) );
    points.add( p0 );
    points.add( p2 );
    edges.add( new Edge( points.get(i*2), points.get(i*2+1) ) );}
  // TODO: Complete this function
}

public static void LineSegmentSetIntersectionAABB( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ) { //<>//
  // TODO: Implement the optimized AABB method for calucating the intersections of a set of line segments.
  // The implemention does NOT need to use an interval tree (a list is sufficient). However, performance matters!
output_intersections.clear();
  ArrayList<Integer> active = new ArrayList <Integer>();

  ArrayList<Event> event = new ArrayList <Event>();

  for (int i=0; i<input_edges.size(); i++)
  {
    event.add(new Event (1, input_edges.get(i).maxy, i));
    event.add(new Event (0, input_edges.get(i).miny, i));
  }

  Collections.sort(event, Collections.reverseOrder());

  for (int i=0; i<event.size(); i++) //<>//
  {
    if (event.get(i).pos == 1)
    {
      active.add(event.get(i).index); //<>//
    } else
    {
      active.remove(Integer.valueOf(event.get(i).index)); //<>//
    }
    if (active.size()>1)
    {
      for (int j=0; j<active.size(); j++)
      {
        for (int k=j+1; k<active.size(); k++)
        {
          boolean intTest = input_edges.get(active.get(j)).aabb.intersectionTest(input_edges.get(active.get(k)).aabb);
          if (intTest) //<>//
          {
            Point intersection = input_edges.get(active.get(j)).intersectionPoint(input_edges.get(active.get(k)));
            
            if (intersection != null)
            {
              output_intersections.add(intersection);
            }
          }
        }
      }
    }
  }
}

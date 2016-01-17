// maze data
boolean x = true;
boolean o = false;
Maze m = new Maze(
  new boolean[][]
    {
      {x,o,x,x,x,x,x,x},
      {x,o,o,o,o,o,o,x},
      {x,o,x,o,x,x,x,x},
      {x,x,x,o,o,o,x,x},
      {x,o,o,o,x,o,o,x},
      {x,o,x,x,x,x,x,x},
      {x,o,o,o,o,o,o,x},
      {x,x,x,x,x,x,o,x}
    });

// game conditions
int winRow = m.getRows() - 1;
int winCol = m.getCols() - 2;
int startRow = 0;
int startCol = 1;

void setup()
{
  size(800, 600);
}

void draw()
{
  m.display();
  explore(startRow, startCol, -1, -1);
  stroke(0,255,0);
  fill(0,255,0);
  rect(startCol * 50, startRow * 50, 50, 50);
  stop();
}

// solve the maze recursively
boolean explore(int r1, int c1, int r2, int c2)
{
  System.out.println(r1 + "," + c1);
  
  if(r1 == winRow && c1 == winCol)
  { 
    // draw a blue rectangle over the winning space
    stroke(0,0,255);
    fill(0,0,255);
    rect(c1 * 50, r1 * 50, 50, 50);
    System.out.println("win");
    return true;
  }
  else
  { 
    // draw rectangle over explored space
    stroke(255,0,0);
    fill(255,0,0);
    rect(c1 * 50, r1 * 50, 50, 50);
    
    // go left
    if(c1 > 0)
     if(!m.getTileAt(r1, c1 - 1) && c1 - 1 != c2)
         if( explore(r1, c1 - 1, r1, c1) ) return true;    
    // go up
    if(r1 > 0)
      if(!m.getTileAt(r1 - 1, c1) && r1 - 1 != r2)
          if( explore(r1 - 1, c1, r1, c1) ) return true; 
    // go down if not prev and possible
    if(r1 < m.getRows() - 1)
      if(!m.getTileAt(r1 + 1, c1) && r1 + 1 != r2)
          if( explore(r1 + 1, c1, r1, c1) ) return true;    
    // go right if not prev and possible
    if(c1 < m.getCols() - 1)
     if(!m.getTileAt(r1, c1 + 1) && c1 + 1 != c2)
         if( explore(r1, c1 + 1, r1, c1) ) return true;
    return false;
  }
}
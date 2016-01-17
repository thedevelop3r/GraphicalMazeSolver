class Maze
{
  private boolean[][] map;
  private char t = 'x';
  private char f = ' ';
  
  // 1-Argument Maze constructor
  public Maze(boolean[][] map)
  {
    this.map = new boolean[map.length][map[0].length];
    for(int r = 0; r < map.length; r++)
    {
      for(int c = 0; c < map[0].length; c++)
      {
        this.map[r][c] = map[r][c];
      }
    }
  }
  
  // output the maze to the console
  @Override
  public String toString()
  {
    String output = "";
    for(int r = 0; r < map.length; r++)
    {
      for(int c = 0; c < map[0].length; c++)
      {
        if(map[r][c] == true) output += t;
        else output += f;
      }
      output += '\n';
    }
    return output;
  }
  
  // return the value of a given tile
  public boolean getTileAt(int r, int c)
  {
    return map[r][c];
  }
  
  // draw the maze as a matrix of black rectangles
  public void display()
  {
    stroke(0);
    fill(0);
    for(int r = 0; r < map.length; r++)
    {
      for(int c = 0; c < map[0].length; c++)
      {
        if(map[r][c] == true)
          rect(c * 50, r * 50, 50, 50);
      }
    }
  }
  
  // get a deep copy of the Maze's map
  public boolean[][] getMap()
  {
    boolean[][] newMap = new boolean[map.length][map[0].length];
    for(int r = 0; r < map.length; r++)
    {
      for(int c = 0; c < map.length; c++)
      {
        newMap[r][c] = map[r][c];
      }
    }
    return newMap;
  }
  
  // get the number of rows in the map
  public int getRows()
  {
    return map.length;
  }
  
  // get the number of cols in the map
  public int getCols()
  {
    return map[0].length;
  }
}
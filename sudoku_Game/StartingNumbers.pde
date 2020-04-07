public static final class StartingNumbers {
  public static final int[][] BLANK_PUZZLE = new int [] []{
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //0
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //1
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //2
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //3
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //4
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //5
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //6
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, //7
    {0, 0, 0, 0, 0, 0, 0, 0, 0} //8
  };

  public static final int[][] EVIL_PUZZLE = new int [] []{
    {6, 0, 0, 0, 7, 0, 1, 0, 0}, 
    {3, 0, 0, 0, 0, 9, 0, 2, 0}, 
    {0, 1, 7, 0, 0, 0, 0, 9, 6}, 
    {0, 0, 0, 0, 0, 5, 6, 0, 0}, 
    {4, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {0, 0, 3, 8, 0, 0, 0, 0, 0}, 
    {9, 7, 0, 0, 0, 0, 8, 4, 0}, 
    {0, 4, 0, 7, 0, 0, 0, 0, 5}, 
    {0, 0, 6, 0, 2, 0, 0, 0, 9}  
  };

  public static final int[][] FIRST_PUZZLE = {
    {0, 0, 5, 0, 2, 9, 0, 0, 0}, 
    {3, 7, 4, 0, 0, 0, 0, 2, 0}, 
    {9, 0, 0, 3, 7, 0, 0, 0, 5}, 
    {0, 9, 0, 0, 3, 0, 0, 0, 0}, 
    {0, 1, 0, 7, 0, 0, 0, 0, 6}, 
    {7, 0, 0, 1, 9, 0, 0, 0, 0}, 
    {0, 0, 0, 2, 5, 0, 0, 3, 0}, 
    {0, 2, 0, 0, 0, 3, 0, 4, 0}, 
    {5, 0, 1, 0, 0, 0, 6, 7, 2}
  };
  
  public static final int[][] FIRST_PUZZLE_2 = parseString("005029000"+ 
                                                           "374000020"+ 
                                                           "900370005"+ 
                                                           "090030000"+ 
                                                           "010700006"+ 
                                                           "700190000"+ 
                                                           "000250030"+ 
                                                           "020003040"+ 
                                                           "501000672");

  /**
   * Read a string of 81 characters and 
   * break it up into a 9x9 sudoku grid.
   *
   * @param sudokuPuzzle The String of numbers to be 
   *   split into a sudoku grid.
   *
   * @return A 9x9 array of ints representing the sudoku puzzle. 
   */
  public static final int[][] parseString(String sudokuPuzzle) {
    int[][] newGrid = new int[9][9];

    int i=0;
    for (char number : sudokuPuzzle.toCharArray()) {
      newGrid[i/9][i%9]=Integer.parseInt(number+"");
      i++;
    }

    return newGrid;
  }
}

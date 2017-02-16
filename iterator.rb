class Iterator
  attr_accessor :grid, :row, :column
  
  def initialize(grid, row, column)
    @grid = grid
    @row = row
    @column = column
  end
  
  def next_cells_from_column(column)
    
  end
end
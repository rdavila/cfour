class Game::Board
  COLS = 7
  ROWS = 6

  def initialize(movements)
    @movements = movements.all
  end

  def has_available_cell_for_column(column)
    @movements.select{ |m| m.y_position == column }.size < ROWS
  end
end

class Game::Board
  COLS = 7
  ROWS = 6

  def initialize(movements)
    @movements = movements.all
  end

  def has_available_cell_for_column(column)
    @movements.select{ |m| m.y_position == column }.size < ROWS
  end

  def get_available_x_position_for_column(column)
    if has_available_cell_for_column(column)
      @movements.select do |m|
        m.y_position == column
      end.map(&:x_position).max.to_i + 1
    end
  end

end

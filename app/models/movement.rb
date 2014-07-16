class Movement < ActiveRecord::Base
  belongs_to :game

  validate :colum_has_available_cell, on: :create

  private

    def colum_has_available_cell
      unless game.board.has_available_cell_for_column(y_position)
        errors.add(:base, 'Column is full')
      end
    end
end

# == Schema Information
#
# Table name: movements
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  x_position :integer
#  y_position :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_movements_on_game_id  (game_id)
#

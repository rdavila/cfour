class Movement < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validate :colum_has_available_cell, on: :create
  validate :current_user_has_the_turn, on: :create

  before_create :set_x_position

  private

    def current_user_has_the_turn
      if game.movements(true).last.try(:user).try(:color) == user.color
        errors.add(:base, 'Please wait for your turn.')
      end
    end

    def set_x_position
      self.x_position = game.board.get_available_x_position_for_column(y_position)
    end

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
#  user_id    :integer
#
# Indexes
#
#  index_movements_on_game_id  (game_id)
#  index_movements_on_user_id  (user_id)
#

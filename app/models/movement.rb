class Movement < ActiveRecord::Base
  belongs_to :game
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

require 'test_helper'

class MovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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

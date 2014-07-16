class Game < ActiveRecord::Base
  belongs_to :user
  has_many   :movements, dependent: :destroy

  scope :active, -> { where(finished: false) }

  def board
    @board ||= Game::Board.new(movements)
  end
end

# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  finished   :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_games_on_user_id  (user_id)
#

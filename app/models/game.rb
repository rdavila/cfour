class Game < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  finished   :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_games_on_user_id  (user_id)
#

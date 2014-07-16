class User < ActiveRecord::Base
  has_many :games
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

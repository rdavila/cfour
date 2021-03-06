class User < ActiveRecord::Base
  has_many :games

  def opponent
    User.where.not(id: id).first
  end
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

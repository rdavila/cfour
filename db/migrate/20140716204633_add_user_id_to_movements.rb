class AddUserIdToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :user, index: true
  end
end

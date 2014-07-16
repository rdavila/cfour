class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.references :game, index: true
      t.integer :x_position
      t.integer :y_position

      t.timestamps
    end
  end
end

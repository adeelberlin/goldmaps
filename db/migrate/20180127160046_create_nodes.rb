class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.string :room_name
      t.decimal :room_number
      t.integer :room_capacity
      t.decimal :x
      t.decimal :y
      t.integer :floor
      t.string :building

      t.timestamps
    end
  end
end

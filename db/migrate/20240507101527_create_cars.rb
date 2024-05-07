class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :color
      t.string :plate_number
      t.string :brand
      t.string :model

      t.timestamps
    end
    add_index :cars, :plate_number, unique: true
  end
end

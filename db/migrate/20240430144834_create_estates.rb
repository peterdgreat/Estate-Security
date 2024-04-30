class CreateEstates < ActiveRecord::Migration[7.1]
  def change
    create_table :estates do |t|
      t.string :name
      t.integer :current_occupancy
      t.string :city
      t.string :state
      t.string :street

      t.timestamps
    end
  end
end

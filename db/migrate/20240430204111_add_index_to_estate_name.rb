class AddIndexToEstateName < ActiveRecord::Migration[7.1]
  def change
    add_index :estates, :name, unique: true
  end
end

class AddPassincodeToVisitors < ActiveRecord::Migration[7.1]
  def change
    add_column :visitors, :pass_in_code, :integer
  end
end

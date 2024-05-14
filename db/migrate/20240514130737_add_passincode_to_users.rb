class AddPassincodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pass_in_code, :integer
  end
end

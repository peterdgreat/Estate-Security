class AddSecurityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :security, :boolean
  end
end

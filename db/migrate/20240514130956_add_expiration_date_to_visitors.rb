class AddExpirationDateToVisitors < ActiveRecord::Migration[7.1]
  def change
    add_column :visitors, :expiration_date, :datetime
  end
end

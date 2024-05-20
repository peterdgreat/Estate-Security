class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.string :title
      t.decimal :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

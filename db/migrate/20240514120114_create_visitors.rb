class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.boolean :active
      t.string :gender
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

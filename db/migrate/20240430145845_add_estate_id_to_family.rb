class AddEstateIdToFamily < ActiveRecord::Migration[7.1]
  def change
    add_reference :families, :estate, foreign_key: true
  end
end

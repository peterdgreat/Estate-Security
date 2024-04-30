class Estate < ApplicationRecord
  has_many :families
  has_many :users
  validates :name, uniqueness: { message: "%{value} has already been taken." }
end

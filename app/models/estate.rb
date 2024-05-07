class Estate < ApplicationRecord
  has_many :families
  has_many :users, dependent: :destroy
  has_many :cars, through: :users
  accepts_nested_attributes_for :users
  validates :name, uniqueness: { message: "%{value} has already been taken." }
end

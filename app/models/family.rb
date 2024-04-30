class Family < ApplicationRecord
  has_many :users
  belongs_to :estate
end

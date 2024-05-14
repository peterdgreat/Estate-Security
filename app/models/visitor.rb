class Visitor < ApplicationRecord
  belongs_to :user, optional: true
end

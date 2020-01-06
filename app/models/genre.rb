
class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  acts_as_paranoid
end


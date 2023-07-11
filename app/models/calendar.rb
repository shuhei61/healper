class Calendar < ApplicationRecord

  has_many :calendar_foods
  has_many :foods, through: :calendar_foods
end

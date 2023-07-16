class Calendar < ApplicationRecord

  has_many :calendar_foods, dependent: :destroy
  has_many :foods, through: :calendar_foods
end
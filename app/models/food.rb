class Food < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :protein, numericality: { allow_float: true }
    validates :fat, numericality: { allow_float: true }
    validates :carbohydrate, numericality: { allow_float: true }
  end

  has_many :calendar_foods
  has_many :calendars, through: :calendar_foods
  belongs_to :user
end

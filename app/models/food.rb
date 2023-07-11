class Food < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :protein, numericality: { allow_float: true }
    validates :fat, numericality: { allow_float: true }
    validates :carbohydrate, numericality: { allow_float: true }
  end
end

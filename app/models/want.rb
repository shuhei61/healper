class Want < ApplicationRecord
  with_options presence: true do
    validates :protein, numericality: { only_integer: true }
    validates :fat, numericality: { only_integer: true }
    validates :carbohydrate, numericality: { only_integer: true }
    validates :diet_weight, numericality: { allow_float: true }
    validates :diet_protein, numericality: { only_integer: true }
    validates :diet_fat, numericality: { only_integer: true }
    validates :diet_carbohydrate, numericality: { only_integer: true }
  end

  belongs_to :user
end

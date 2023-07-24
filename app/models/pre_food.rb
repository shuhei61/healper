class PreFood < ApplicationRecord

  has_many :calendar_pre_foods
  has_many :calendars, through: :calendar_pre_foods

end

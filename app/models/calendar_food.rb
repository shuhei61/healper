class CalendarFood < ApplicationRecord
  belongs_to :calendar
  belongs_to :food
end

class CalendarPreFood < ApplicationRecord
  belongs_to :calendar
  belongs_to :pre_food
  after_destroy :check_related_calendar_pre_foods

  private

  def check_related_calendar_pre_foods
    calendar.check_and_destroy_if_no_related_calendar_pre_foods
  end
  
end

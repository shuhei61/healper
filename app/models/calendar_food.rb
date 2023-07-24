class CalendarFood < ApplicationRecord
  belongs_to :calendar
  belongs_to :food
  after_destroy :check_related_calendar

  private

  def check_related_calendar
    calendar.check_and_destroy_if_no_related_calendar
  end
end

class Calendar < ApplicationRecord

  validates :date, presence: true

  has_many :calendar_foods, dependent: :destroy
  has_many :calendar_pre_foods, dependent: :destroy
  has_many :foods, through: :calendar_foods
  has_many :pre_foods, through: :calendar_pre_foods

  def check_and_destroy_if_no_related_calendar
    if calendar_pre_foods.empty? && calendar_foods.empty?
      destroy
    end
  end

  belongs_to :user

end
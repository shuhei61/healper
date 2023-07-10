class CalendarsController < ApplicationController
  # before_action: move_to_session, only:[:new, :edit]
  # before_action: move_to_index, only:[:show, :edit, :destroy]

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      start_date = Date.today - 6.days
      end_date = Date.today
      @calendars = Calendar.where(date: start_date..end_date)
    end
  end

  def new
    @calendar = Calendar.new
  end

  def create
  end

  def show
  end

  private
  def create_calendar
  end
  
  # def move_to_index
  #   unless current_user.id == @calendar.
  #     redirect_to "/"
  #   end
  # end

  # def move_to_session
  #   unless user_signed_in?
  #     redirect_to "/"
  #   end
  # end

end

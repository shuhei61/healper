class CalendarsController < ApplicationController
  # before_action: move_to_session, only:[:new, :edit]
  # before_action: move_to_index, only:[:show, :edit, :destroy]

  def index
    if user_signed_in?
      get_week
      @user = User.find(current_user.id)
      @calendar = Calendar.new
    end
  end

  def create
    @calendar = Calendar.new(create_calendar)
    if @calendar.save
      redirect_to "/"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  def create_calendar
    params.require(:calendar).permit(:date, food_ids: []).merge(user_id: current_user.id)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @start_date = Date.today - 3.days
    @end_date = Date.today + 3.days
    @calendars = Calendar.where(date: @start_date..@end_date)

    @week_days = []

    7.times do |x|
      today_plans = []
      @calendars.each do |calendar|
        today_plans.push(*calendar.foods) if calendar.date == @start_date + x
      end

      wday_num = @start_date.wday + x
      if wday_num > 6
        wday_num = wday_num - 7
      end

      days = { month: (@start_date + x).month, date: (@start_date+x).day, plans: today_plans, wday: wdays[wday_num]}
      @week_days.push(days)
    end

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

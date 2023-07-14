class CalendarsController < ApplicationController
  include CalendarsHelper
  # before_action: move_to_session, only:[:new, :edit]
  # before_action: move_to_index, only:[:show, :edit, :destroy]

  def index
    if user_signed_in?
      get_week
      @user = User.find(current_user.id)
      @want = Want.find_by(user_id:@user.id)
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

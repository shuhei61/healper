class CalendarsController < ApplicationController
  include CalendarsHelper
  # before_action: move_to_session, only:[:new, :edit]
  # before_action: move_to_index, only:[:show, :edit, :destroy]

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      @want = Want.find_by(user_id:@user.id)
      @calendar = Calendar.new
      get_week
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

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to request.referer
  end

  private
  def create_calendar
    params.require(:calendar).permit(:date, food_ids: [], pre_food_ids: []).merge(user_id: current_user.id)
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

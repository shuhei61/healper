class WantsController < ApplicationController
  include CalendarsHelper

  def update
    get_week
    @user = User.find(current_user.id)
    @want = Want.find_by(user_id:@user.id)
    @calendar = Calendar.new
    if @want.update(create_wants_params)
      redirect_to "/"
    else
      render template: "calendars/index", status: :unprocessable_entity
    end
  end

  private
  
  def create_wants_params
    params.require(:want).permit(:weight,:protein,:fat,:carbohydrate,:diet_weight,:diet_protein,:diet_fat,:diet_carbohydrate).merge(user_id:current_user.id)
  end
end

class CalendarFoodsController < ApplicationController

  def destroy
    calendar = Calendar.find(params[:calendar_id])
    calendar_food = calendar.calendar_foods.find_by(food_id: params[:id])
    calendar_food.destroy
    redirect_to "/"
  end

end

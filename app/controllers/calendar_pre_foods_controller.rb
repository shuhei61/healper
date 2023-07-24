class CalendarPreFoodsController < ApplicationController

  def destroy
    calendar = Calendar.find(params[:calendar_id])
    calendar_pre_food = calendar.calendar_pre_foods.find_by(pre_food_id: params[:id])
    calendar_pre_food.destroy
    redirect_to "/", notice: "予定を削除しました。"
  end
end

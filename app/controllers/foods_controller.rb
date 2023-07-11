class FoodsController < ApplicationController
  def index
    @foods = Food.order("created_at DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(create_food)
    if @food.save
      redirect_to "/foods"      
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def create_food
    params.require(:food).permit(:name,:protein,:fat,:carbohydrate).merge(user_id:current_user.id)
  end
end

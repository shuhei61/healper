class FoodsController < ApplicationController
  def index
    @foods = Food.order("created_at DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(create_food)
    calorie = (@food.protein*4 + @food.fat*9 + @food.carbohydrate*4).round
    @food.calorie = calorie
    if @food.save
      redirect_to "/foods"      
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(create_food)
      redirect_to "/foods/#{@food.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to "/foods"
  end


  private
  def create_food
    params.require(:food).permit(:name,:protein,:fat,:carbohydrate).merge(user_id:current_user.id)
  end
end

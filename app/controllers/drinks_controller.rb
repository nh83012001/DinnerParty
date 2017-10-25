class DrinksController < ApplicationController

  def create
    @drink = Drink.new(drink_params)

    if @drink.save
      redirect_to dinner_path(params[:drink][:dinner_id])
    else
      flash.now[:error] = 'There was an error in adding your recipe!'
      redirect_to my_profile_path
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @dinner = Dinner.find(@drink.dinner_id)
    @drink.destroy
    redirect_to dinner_path(@dinner)
  end

  private

  def drink_params
    params.require(:drink).permit(:user_id, :dinner_id, :drink_type, :quantity)
  end
end

class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all
  end

  def show
    @dinner = Dinner.find(params[:id])
  end

  def new

    @dinner = Dinner.new
    @dinner.invites.build
  end

  def create
    @dinner = Dinner.create(dinner_params)
    params[:dinner][:user_ids].each do |id|
      @dinner.users << User.find(id) unless id==""
    end
    redirect_to dinner_path(@dinner)

  end

  private

  def dinner_params
    params.require(:dinner).permit(:location, :time, :host_id, :name, :attire)
  end

end

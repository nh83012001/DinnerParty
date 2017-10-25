class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all
  end

  def show
    @dinner = Dinner.find(params[:id])
    @owner = User.find(session[:user_id])
    @invite = Invite.new
    @uninvited = User.uninvited(@dinner)
  end

  def new
    @owner = User.find(session[:user_id])
    @dinner = Dinner.new
    @dinner.invites.build
  end

  def create
    @dinner = Dinner.new(dinner_params)

    if @dinner.save
      params[:dinner][:user_ids].each do |id|
        @dinner.users << User.find(id) unless id==""
      end
      redirect_to dinner_path(@dinner)
    else
      render :new
    end
  end

  def edit
    @dinner = Dinner.find(params[:id])
  end

  def update
    @dinner = Dinner.find(params[:id])
    @dinner.assign_attributes(dinner_params)
    if @dinner.save
      redirect_to dinner_path(@dinner)
    else
      render :edit
    end
  end

  def destroy
    @dinner = Dinner.find(params[:id])
    @dinner.destroy
    redirect_to my_profile_path
  end

  private

  def dinner_params
    params.require(:dinner).permit(:location, :date, :host_id, :name, :attire)
  end

end

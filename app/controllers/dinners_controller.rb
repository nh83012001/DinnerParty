class DinnersController < ApplicationController
  before_filter :authorize_invitee_host, only: :show

  def authorize_invitee_host
    if session[:user_id] == nil
      render :error
    else
      @dinner = Dinner.find(params[:id])
      @user = User.find(session[:user_id])
      @invite = @dinner.invites.find_by(user: @user)
      unless @dinner.host == @user || @invite
        render :error
      end
    end
  end

  ##

  def show
    @dinner = Dinner.find(params[:id])
    @course = Course.new
    @drink = Drink.new
    @user = User.find(session[:user_id])
    @invite = Invite.new
    @uninvited = User.uninvited(@dinner)
  end

  def new
    @owner = User.find(session[:user_id])
    @other_users = User.other_users(session[:user_id])
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
    Invite.destroy_without_dinner(params[:id])
    Course.destroy_without_dinner(params[:id])
    @dinner.destroy
    redirect_to my_profile_path
  end



  private

  def dinner_params
    params.require(:dinner).permit(:location, :date, :host_id, :name, :attire)
  end

end

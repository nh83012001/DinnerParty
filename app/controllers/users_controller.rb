class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to my_profile_path
    else
        render :new
    end
  end

  def newrecipe
    @user = User.find(params[:id])
    @recipe = Recipe.new
  end

  def myprofile
    @course = Course.new
    @drink = Drink.new
    @user = User.find(session[:user_id])
    @created_dinners = Dinner.where(host_id: @user.id)
    @invited_dinners = @user.invites.where(accepted: nil)
    @accepted_dinners = @user.invites.where(accepted: true)
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end

end

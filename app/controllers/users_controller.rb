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
        redirect_to user_path(@user)
    else
        render :new
    end
  end

  def newrecipe
    @user = User.find(params[:id])
    @recipe = Recipe.new
  end

  def myprofile
    @user = User.find_by_id(session[:current_user_id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end

end

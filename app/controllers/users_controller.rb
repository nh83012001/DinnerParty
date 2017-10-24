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
    @user = User.find_by_id(session[:user_id])
    render :myprofile
  end

  def edit
  end

  def update
      # should add to its own method at a later date
    @user = User.find(session[:user_id])
    @recipe = Recipe.find(params[:id])
    if @user.recipes.include?(@recipe)
      flash[:alert] = "Recipe already in your cookbook!"
      redirect_to recipe_path(params[:id])
    else
      @user.recipes << @recipe
      @user.save
      flash.now[:notice] = "Recipe Succesfully Added!"
      render :myprofile
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end

end

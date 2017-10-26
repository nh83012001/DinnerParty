class RecipesController < ApplicationController
  include RecipesHelper

  def new
    @recipe = Recipe.new
    @owner = get_user_reference
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # @recipe.user_ids << params[:recipe][:owner_id]
      @recipe.users << @recipe.owner
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def fork
    originrecipe = Recipe.find(params[:recipe_id])
    @recipe =  originrecipe.dup

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all

    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @user = get_user_reference
    @recipe = Recipe.find(params[:id])
    if @recipe.owner_id == session[:user_id]
      alter_recipe_by_owner
    else
      add_recipe_to_user
    end
  end

  def add_recipe_to_user
    if @user.recipes.include?(@recipe)
      flash[:alert] = "Recipe already in your cookbook!"
      redirect_to recipe_path(params[:id])
    else
      @user.recipes << @recipe
      @user.save
      flash.now[:notice] = "Recipe Succesfully Added!"
      render :'users/myprofile'
    end
  end

  def alter_recipe_by_owner
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    Userrecipe.destroy_related(params[:id])
    Course.destroy_related(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :owner_id)
  end
end

class Course < ApplicationRecord
  belongs_to :userrecipe
  belongs_to :dinner

  def recipe_name
    self.userrecipe.recipe.name
  end

  def recipe_id
    self.userrecipe.recipe.id
  end

  def user_name
    self.userrecipe.user.name
  end

  def recipe
    self.userrecipe.recipe
  end

  def user
    self.userrecipe.user
  end

  def self.destroy_related(id)
    self.where(:recipe_id == id).destroy_all
  end

  def self.destroy_without_dinner(id)
    self.where(:dinner_id == id).destroy_all
  end
end

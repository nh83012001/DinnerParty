class Course < ApplicationRecord
  belongs_to :userrecipe
  belongs_to :dinner

  def recipe_name
    self.userrecipe.recipe.name
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
end

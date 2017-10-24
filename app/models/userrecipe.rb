class Userrecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :courses
  has_many :dinners, through: :courses

  def recipe_name
    self.recipe.name
  end

  def user_name
    self.user.name
  end 
end

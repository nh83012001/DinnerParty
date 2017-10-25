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

  def self.destroy_related(id)
    self.where(recipe_id: id).destroy_all
  end
end

class Recipe < ApplicationRecord
  has_many :courses
  has_many :userrecipes
  has_many :users, through: :userrecipes
  belongs_to :owner, class_name: "User"
end

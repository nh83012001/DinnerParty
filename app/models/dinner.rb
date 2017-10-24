class Dinner < ApplicationRecord
  has_many :courses
  has_many :invites
  has_many :users, through: :invites
  has_many :userrecipes, through: :courses
end

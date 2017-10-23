class User < ApplicationRecord
  has_many :invites
  has_many :dinners, through: :invites
  has_many :userrecipes
  has_many :recipes, through: :userrecipes
end

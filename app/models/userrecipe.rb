class Userrecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :courses
  has_many :dinners, through: :courses
end

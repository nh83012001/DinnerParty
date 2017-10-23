class Course < ApplicationRecord
  belongs_to :recipes
  belongs_to :dinners
end

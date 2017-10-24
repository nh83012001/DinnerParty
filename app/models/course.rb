class Course < ApplicationRecord
  belongs_to :userrecipe
  belongs_to :dinner
end

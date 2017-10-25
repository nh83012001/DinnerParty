class Recipe < ApplicationRecord
  has_many :courses
  has_many :userrecipes
  has_many :users, through: :userrecipes
  belongs_to :owner, class_name: "User"



  def self.search(search)
    where("name LIKE ? or ingredients LIKE ? or instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def self.course_type
    ['appetizer', 'main course', 'desert', 'alchohol']
  end

  def popularity
    self.users.count
  end
end

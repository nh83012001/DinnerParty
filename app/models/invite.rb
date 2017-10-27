class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :dinner

  def self.destroy_without_dinner(id)
    self.where(:dinner_id == id).destroy_all
  end

  def destroy_related_courses
    self.user.courses.where(dinner_id: dinner_id).destroy_all
    self.user.drinks.where(dinner_id: dinner_id).destroy_all
  end
end

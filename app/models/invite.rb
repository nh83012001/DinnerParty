class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :dinner

  def self.destroy_without_dinner(id)
    self.where(:dinner_id == id).destroy_all
  end
end

class Drink < ApplicationRecord
  belongs_to :user
  belongs_to :dinner

  def self.drink_designations
    ['wine', 'beer', 'liquor', 'soda']
  end
end

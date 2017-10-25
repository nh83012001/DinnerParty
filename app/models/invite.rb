class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :dinner

  def test_invite_for_acceptence
    binding.pry
    self != nil && self.accepted == true
  end
end

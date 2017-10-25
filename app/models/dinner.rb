class Dinner < ApplicationRecord
  has_many :courses
  has_many :invites
  has_many :users, through: :invites
  has_many :userrecipes, through: :courses
  belongs_to :host, class_name: "User"
  has_many :drinks


  def accepted_invitations
    self.invites.where(accepted: true)
  end

  def declined_invitations
    self.invites.where(accepted: false)
  end

  def pending_invitations
    self.invites.where(accepted: nil)
  end
end

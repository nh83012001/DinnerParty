class User < ApplicationRecord
  has_secure_password

  has_many :invites
  has_many :dinners, through: :invites
  has_many :userrecipes
  has_many :recipes, through: :userrecipes
  has_many :owned_recipes, class_name:  "Recipe",
                                foreign_key: "owner_id",
                                dependent:   :destroy
  has_many :drinks


  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, length: { minimum: 6}
  validates :name, uniqueness: true
  validates :name, presence: true

  def create
    user = User.new(user_params).save
  end

  def self.uninvited(dinner)
    User.where("id NOT IN (?)", dinner.invites.pluck(:user_id))
  end

  def has_drink_course_privalege(dinner)
    invite = dinner.invites.find_by(user: self)
    if ((invite != nil && invite.accepted == true ) || dinner.host == self) && dinner.upcoming?
      true
    else
      false
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

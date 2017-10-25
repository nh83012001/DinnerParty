class InvitesController < ApplicationController
  def accept
    @invite = Invite.find(params[:invite_id])
    @user = @invite.user
    @invite.accepted = true
    @invite.save
    redirect_to my_profile_path
  end

  def reject
    @invite = Invite.find(params[:invite_id])
    @user = @invite.user
    @invite.accepted = false
    @invite.save
    redirect_to my_profile_path
  end

  def create
    @invite = Invite.new(invite_params)
    @dinner = Dinner.find(params[:invite][:dinner_id])
    if @invite.save
      redirect_to dinner_path(@dinner)
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:user_id, :dinner_id)
  end
end

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
end

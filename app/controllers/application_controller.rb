class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize_invitee_host
    @dinner = Dinner.find(params[:id])
    @user = User.find(session[:user_id])
    @invite = @dinner.invites.find_by(user: @user)
    unless @dinner.host == @user || @invite
      redirect_to :back, status: 401
    end
  end
  
end

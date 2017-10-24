class SessionsController < ApplicationController

  def login
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])

    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to my_profile_path
    else
      flash.now[:error] = "Invalid username/password."
      render :login
    end

  end

  def destroy
    session.delete :user_id
  end


end

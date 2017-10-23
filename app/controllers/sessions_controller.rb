class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name][:username])
    if user && user.authenticate(params[:session][:password])

    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end

module SessionsHelper

  def get_user_id
    session[:user_id]
  end

  def get_user_reference
    User.find(get_user_id)
  end
  
end

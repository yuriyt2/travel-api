class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    username = params[:username]
    password = params[:password]
    user = User.find_by({username:username})
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to destinations_path
      else
        flash.notice = "UNAUTHORIZED"
        redirect_to root_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  after_action :set_access_control_headers

   def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'GET'
   end

def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 helper_method(:current_user)

#Determine if user is logged in.
 def logged_in
   puts "user: #{current_user}"
    !current_user.nil?
  end

#Lock users out of portions of the site if they are not logged in.
 def authenticate
   unless logged_in
     flash[:error] = "Please log in."
     redirect_to root_path
   end
 end
end

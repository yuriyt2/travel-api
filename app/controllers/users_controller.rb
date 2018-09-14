class UsersController < ApplicationController
skip_before_action :authenticate
  private

  def user_params
    params.require(:user).permit(:username,:password)
  end


end

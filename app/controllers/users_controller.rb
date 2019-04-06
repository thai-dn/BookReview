class UsersController < ApplicationController

  def index
    
  end
  def show
    redirect_to root_path
  end

  def sign_out
    current_user.destroy
    redirect_to root_path
  end

end
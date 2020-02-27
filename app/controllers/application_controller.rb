class ApplicationController < ActionController::Base
  def is_login
    redirect_to root_path unless current_user
  end
end

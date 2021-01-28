class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session

  # after_action :set_csrf_cookie

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def is_login
    redirect_to root_path unless current_user
  end
end

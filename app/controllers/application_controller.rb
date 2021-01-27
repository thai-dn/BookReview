class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  after_action :csrf_meta_tags

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def csrf_meta_tags
    if defined?(protect_against_forgery?) && protect_against_forgery?
      [
        tag("meta", name: "csrf-param", content: request_forgery_protection_token),
        tag("meta", name: "csrf-token", content: form_authenticity_token)
      ].join("\n").html_safe
    end
  end

  def is_login
    redirect_to root_path unless current_user
  end
end

Devise.setup do |config|

  config.mailer_sender = 'thaidn59@gmail.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET'], { access_type: 'online', approval_prompt: '', skip_jwt: true, callback_url: "http://localhost:8080/users/auth/google_oauth2/callback" }

  require 'omniauth-facebook'
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']

  # config.omniauth :facebook, "276224326612331", "p9OcdYTPKci5Fxue8LsQv2WZsTQ", callback_url: "http://localhost:3000/users/auth/facebook/callback"
end

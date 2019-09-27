Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'email,user_likes', :provider_ignores_state => true}
  # HEROKU
  provider :heroku, ENV.fetch("HEROKU_OAUTH_ID"), ENV.fetch("HEROKU_OAUTH_SECRET")
end